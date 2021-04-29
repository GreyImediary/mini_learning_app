import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/bloc/auth/auth_repository.dart';
import 'package:mini_learning_app/model/user/user.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  final AuthStatus status;

  const AuthFailure(this.message, this.status);

  @override
  List<Object> get props => [message, status];
}

class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}