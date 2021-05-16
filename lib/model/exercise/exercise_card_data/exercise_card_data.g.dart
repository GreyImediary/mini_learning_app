// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseCardData _$ExerciseCardDataFromJson(Map<String, dynamic> json) {
  return ExerciseCardData(
    json['id'] as int,
    json['title'] as String,
    (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['previewUrl'] as String?,
    json['articles'] as int,
    json['tests'] as int,
  );
}

Map<String, dynamic> _$ExerciseCardDataToJson(ExerciseCardData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tags': instance.tags,
      'previewUrl': instance.imageUrl,
      'articles': instance.articleCount,
      'tests': instance.testCount,
    };
