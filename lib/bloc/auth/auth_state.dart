import 'package:mini_learning_app/bloc/auth/auth_repository.dart';

class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLogin extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  final AuthStatus status;

  const AuthFailure(this.message, this.status);
}

class AuthSuccess extends AuthState {}