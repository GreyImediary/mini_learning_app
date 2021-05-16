import 'package:json_annotation/json_annotation.dart';
import 'package:mini_learning_app/model/tag/tag.dart';

part 'exercise_card_data.g.dart';

@JsonSerializable()
class ExerciseCardData {
  final int id;
  final String title;
  final List<Tag> tags;
  @JsonKey(name: 'previewUrl')
  final String? imageUrl;
  @JsonKey(name: 'articles')
  final int articleCount;
  @JsonKey(name: 'tests')
  final int testCount;

  ExerciseCardData(
    this.id,
    this.title,
    this.tags,
    this.imageUrl,
    this.articleCount,
    this.testCount,
  );

  factory ExerciseCardData.fromJson(Map<String, dynamic> json) => _$ExerciseCardDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseCardDataToJson(this);
}
