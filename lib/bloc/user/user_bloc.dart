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
      yield await _saveToFavorites(event.articleId);
    } else if (event is UserArticleDeleted) {
      yield await _deleteFromFavorites(event.articleId);
    }
  }

  Future<UserState> _saveToFavorites(int articleId) async {
    final isArticleSaved = await userRepository.saveToFavorite(articleId);

    if (isArticleSaved) {
      return UserArticleSaveSuccess(articleId);
    } else {
      return UserArticleSaveFail();
    }
  }

  Future<UserState> _deleteFromFavorites(int articleId) async {
    final isArticleDeleted = await userRepository.deleteFromFavorites(articleId);

    if (isArticleDeleted) {
      return UserArticleDeleteSuccess(articleId);
    } else {
      return UserArticleDeleteFail();
    }
  }
}