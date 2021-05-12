import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/favorites/favorites_event.dart';
import 'package:mini_learning_app/bloc/favorites/favorites_repository.dart';
import 'package:mini_learning_app/bloc/favorites/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository articleRepository;

  FavoritesBloc(
    this.articleRepository,
  ) : super(FavoritesInitial());

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is FavoritesRequested) {
      final favorites = await articleRepository.getFavorites();

      yield FavoritesSuccess(favorites);
    } else if (event is FavoritesReset) {
      yield FavoritesInitial();

      add(FavoritesRequested());
    }
  }
}
