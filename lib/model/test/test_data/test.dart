import 'package:mini_learning_app/model/test/question/one_of_question/one_of_question.dart';
import 'package:mini_learning_app/model/test/question/question.dart';

class Test {
  final int id;
  final String title;
  final String imageUrl;
  final List<Question> questions;
  final bool isFinished;

  Test(
    this.id,
    this.title,
    this.imageUrl,
    this.questions,
    this.isFinished,
  );

  factory Test.fromJson(Map<String, dynamic> json) {
    final List<Question> questions = (json['oneOfQuestions'] as List<dynamic>)
        .map((e) => OneOfQuestion.fromJson(e as Map<String, dynamic>))
        .toList()
          ..sort((firstQuestion, secondQuestion) {
            return firstQuestion.order.compareTo(secondQuestion.order);
          });

    return Test(
      json['id'] as int,
      json['title'] as String,
      json['previewUrl'] as String,
      questions,
      json['isFinished'] as bool,
    );
  }
}
