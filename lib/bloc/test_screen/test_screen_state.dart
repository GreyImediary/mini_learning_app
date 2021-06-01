import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/model/test/question_answer_data/answer_data.dart';

class TestScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class TestScreenInitial extends TestScreenState {
  final int initialIndex;


  TestScreenInitial({this.initialIndex = 0});

  @override
  List<Object> get props => [initialIndex];
}

class TestAnswerAccept extends TestScreenState {}

class TestAnswerSuccess extends TestScreenState {
  final AnswerData answer;

  TestAnswerSuccess(this.answer);

  @override
  List<Object> get props => [answer];
}

class TestNextQuestion extends TestScreenState {
  final int index;

  TestNextQuestion(this.index);

  @override
  List<Object> get props => [index];
}

class TestFinish extends TestScreenState {}