import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/model/test/question_answer_data/answer_data.dart';

class TestScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TestNextQuestionRequested extends TestScreenEvent {}

class TestAnswerRequested extends TestScreenEvent {}

class TestAnswerSent extends TestScreenEvent {
  final AnswerData answer;

  TestAnswerSent(this.answer);

  @override
  List<Object> get props => [answer];
}