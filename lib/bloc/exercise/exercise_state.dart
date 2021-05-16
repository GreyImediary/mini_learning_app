import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/model/exercise/exercise_card_data/exercise_card_data.dart';

class ExerciseState extends Equatable {

  const ExerciseState();

  @override
  List<Object> get props => [];
}

class ExerciseInitial extends ExerciseState {}

class ExercisesSuccess extends ExerciseState {
  final List<ExerciseCardData> exercises;

  ExercisesSuccess(this.exercises);

  @override
  List<Object> get props => [exercises];
}