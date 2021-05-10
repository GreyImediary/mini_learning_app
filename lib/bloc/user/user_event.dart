import 'package:equatable/equatable.dart';

class UserEvent extends Equatable {

  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserArticleSaved extends UserEvent {
  final int articleId;

  UserArticleSaved(this.articleId);

  @override
  List<Object> get props => [articleId];
}