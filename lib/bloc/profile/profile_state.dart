import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/model/user/user.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final User user;

  ProfileSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class ProfileFail extends ProfileState {}