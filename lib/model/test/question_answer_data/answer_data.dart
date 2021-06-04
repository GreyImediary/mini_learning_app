abstract class AnswerData {
  final bool isCorrect;


  AnswerData(this.isCorrect);

  Map<String, dynamic> toJson();
}