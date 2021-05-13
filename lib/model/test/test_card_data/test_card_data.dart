import 'package:json_annotation/json_annotation.dart';
import 'package:mini_learning_app/model/tag/tag.dart';

part 'test_card_data.g.dart';

@JsonSerializable()
class TestCardData {
  final int id;
  final String title;
  @JsonKey(name: 'previewUrl')
  final String? imageUrl;
  final List<Tag> tags;
  final int oneOfQuestions;
  final int manyOfQuestions;
  final int exactAnswerQuestions;
  final int orderQuestions;
  final bool isFinished;

  TestCardData(
    this.id,
    this.title,
    this.imageUrl,
    this.tags,
    this.oneOfQuestions,
    this.manyOfQuestions,
    this.exactAnswerQuestions,
    this.orderQuestions,
    this.isFinished,
  );

  factory TestCardData.fromJson(Map<String, dynamic> json) => _$TestCardDataFromJson(json);

  Map<String, dynamic> toJson() => _$TestCardDataToJson(this);
}
