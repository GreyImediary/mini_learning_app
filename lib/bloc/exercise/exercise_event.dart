import 'package:equatable/equatable.dart';

class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

class ExercisesRequested extends ExerciseEvent {}

class ExercisesReset extends ExerciseEvent {}