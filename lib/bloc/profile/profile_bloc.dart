import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/profile/profile_event.dart';
import 'package:mini_learning_app/bloc/profile/profile_state.dart';
import 'package:mini_learning_app/bloc/user/user_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository repository;

  ProfileBloc(this.repository) : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileUserRequested) {
      final user = await repository.getCurrentUser();

      if (user == null) {
        yield ProfileFail();
      } else {
        yield ProfileSuccess(user);
      }
    }
  }
}