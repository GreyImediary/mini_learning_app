import 'package:mini_learning_app/model/test/question_answer_data/answer_data.dart';

class OneOfAnswerData extends AnswerData {
  final String id;
  final int optionId;
  final bool isCorrect;

  OneOfAnswerData(this.id, this.optionId, this.isCorrect) : super(isCorrect);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'question': id,
        'answer': optionId,
      };
}
