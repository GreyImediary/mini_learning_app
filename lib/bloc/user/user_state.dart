import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserArticleSaveSuccess extends UserState {
  final int articleId;

  UserArticleSaveSuccess(this.articleId);

  @override
  List<Object> get props => [articleId];
}
class UserArticleSaveFail extends UserState {}

class UserArticleDeleteSuccess extends UserState {
  final articleId;

  UserArticleDeleteSuccess(this.articleId);

  @override
  List<Object> get props => [articleId];
}

class UserArticleDeleteFail extends UserState {}