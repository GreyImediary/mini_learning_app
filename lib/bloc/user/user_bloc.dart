import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/user/user_event.dart';
import 'package:mini_learning_app/bloc/user/user_repository.dart';
import 'package:mini_learning_app/bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  
  UserBloc(this.userRepository) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserArticleSaved) {
      final isArticleSaved = await userRepository.saveToFavorite(event.articleId);

      if (isArticleSaved) {
        yield UserArticleSaveSuccess(event.articleId);
      } else {
        yield UserArticleSaveFail();
      }
    }
  }
}