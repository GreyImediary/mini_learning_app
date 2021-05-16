import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/exercise/exercise_event.dart';
import 'package:mini_learning_app/bloc/exercise/exercise_repository.dart';
import 'package:mini_learning_app/bloc/exercise/exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository favoritesRepository;

  ExerciseBloc(
      this.favoritesRepository,
      ) : super(ExerciseInitial());

  @override
  Stream<ExerciseState> mapEventToState(ExerciseEvent event) async* {
    if (event is ExercisesRequested) {
      final favorites = await favoritesRepository.getExercises();

      yield ExercisesSuccess(favorites);
    } else if (event is ExercisesReset) {
      yield ExerciseInitial();

      add(ExercisesRequested());
    }
  }
}