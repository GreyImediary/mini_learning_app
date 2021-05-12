import 'package:equatable/equatable.dart';

class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesRequested extends FavoritesEvent {}

class FavoritesReset extends FavoritesEvent {}