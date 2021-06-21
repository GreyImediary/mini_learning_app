import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/model/test/question_answer_data/answer_data.dart';

class TestScreenState {}

class TestScreenInitial extends TestScreenState {
  final int initialIndex;

  TestScreenInitial({this.initialIndex = 0});
}

class TestAnswerAccept extends TestScreenState {}

class TestAnswerSuccess extends TestScreenState {
  final AnswerData answer;

  TestAnswerSuccess(this.answer);
}

class TestNextQuestion extends TestScreenState {
  final int index;

  TestNextQuestion(this.index);
}

class TestFinish extends TestScreenState {}