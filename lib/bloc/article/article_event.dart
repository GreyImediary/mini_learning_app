import 'package:equatable/equatable.dart';

class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class ArticlesRequested extends ArticleEvent {}

class ArticlesReset extends ArticleEvent {}
