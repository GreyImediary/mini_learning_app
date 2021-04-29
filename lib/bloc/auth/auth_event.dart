import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/bloc/auth/auth_repository.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStatusChanged extends AuthEvent {
  final AuthStatus status;

  const AuthStatusChanged(this.status);

  @override
  List<Object> get props => [status];
}