import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/model/article/article.dart';

class ArticleState extends Equatable {

  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticlesSuccess extends ArticleState {
  final List<Article> articles;

  ArticlesSuccess(this.articles);

  @override
  List<Object> get props => [articles];
}