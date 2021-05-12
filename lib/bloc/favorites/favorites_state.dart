import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/model/article/article.dart';

class FavoritesState extends Equatable {

  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesSuccess extends FavoritesState {
  final List<Article> favorites;

  FavoritesSuccess(this.favorites);

  @override
  List<Object> get props => [favorites];
}