import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mini_learning_app/model/test/option/one_of_option/one_of_option.dart';
import 'package:mini_learning_app/model/test/question/question.dart';
import 'package:mini_learning_app/ui/widgets/test_widgets/question_widget/one_of_question_widget.dart';

part 'one_of_question.g.dart';

@JsonSerializable()
class OneOfQuestion extends Question {
  final String id;
  final String type;
  final String text;
  final int order;
  final List<OneOfOption> options;

  OneOfQuestion(
    this.id,
    this.type,
    this.text,
    this.order,
    this.options,
  ) : super(
          id,
          type,
          text,
          order,
        );

  @override
  Widget render() => OneOfQuestionWidget(question: this);
  
  factory OneOfQuestion.fromJson(Map<String, dynamic> json) => _$OneOfQuestionFromJson(json);
  
  Map<String, dynamic> toJson() => _$OneOfQuestionToJson(this);
}
