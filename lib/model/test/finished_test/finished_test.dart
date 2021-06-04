import 'package:json_annotation/json_annotation.dart';
import 'package:mini_learning_app/model/test/question_answer_data/one_of_answer_data.dart';

class FinishedTest {
  @JsonKey(name: 'finishedBy')
  final int userId;
  @JsonKey(name: 'test')
  final int testId;
  final List<OneOfAnswerData> oneOfQuestionAnswers;

  FinishedTest(
    this.userId,
    this.testId,
    this.oneOfQuestionAnswers,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'finishedBy': userId,
    'test': testId,
    'oneOfQuestionAnswers': oneOfQuestionAnswers.map((e) => e.toJson()).toList(),
    'manyOfQuestionAnswers': [],
    'orderQuestionAnswers': [],
    'exactAnswerQuestionAnswers': []
  };
}
