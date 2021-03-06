import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/auth/auth_event.dart';
import 'package:mini_learning_app/bloc/auth/auth_repository.dart';
import 'package:mini_learning_app/bloc/auth/auth_state.dart';
import 'package:mini_learning_app/bloc/user/user_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  late StreamSubscription _statusStream;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository
  })
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(AuthInitial()) {
    _statusStream = _authRepository.status.listen((status) {
      add(AuthStatusChanged(status));
    });
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthStatusChanged) {
      yield await _mapAuthEventToState(event);
    }
  }

  Future<AuthState> _mapAuthEventToState(AuthStatusChanged event) async {
    final status = event.status;
    switch (status) {
      case AuthStatus.unknown:
        return AuthInitial();
      case AuthStatus.authenticated:
        await _userRepository.getCurrentUser();
        return AuthSuccess();
      case AuthStatus.unauthenticated:
        return AuthLogin();
      case AuthStatus.loginError:
        return AuthFailure(
          'Не удаётся войти. Пожалуйста, проверьте правильность ввода почты и пароля.',
          AuthStatus.loginError,
        );
      case AuthStatus.refreshError:
        return AuthFailure(
          'Ваша сессия истекла. Пожалуйста, повторите авторизацию.',
          AuthStatus.refreshError,
        );
      default:
        return AuthInitial();
    }
  }

  @override
  Future<void> close() {
    _statusStream.cancel();
    _authRepository.dispose();
    return super.close();
  }
}
