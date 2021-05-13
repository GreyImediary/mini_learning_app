// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestCardData _$TestCardDataFromJson(Map<String, dynamic> json) {
  return TestCardData(
    json['id'] as int,
    json['title'] as String,
    json['previewUrl'] as String?,
    (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['oneOfQuestions'] as int,
    json['manyOfQuestions'] as int,
    json['exactAnswerQuestions'] as int,
    json['orderQuestions'] as int,
    json['isFinished'] as bool,
  );
}

Map<String, dynamic> _$TestCardDataToJson(TestCardData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'previewUrl': instance.imageUrl,
      'tags': instance.tags,
      'oneOfQuestions': instance.oneOfQuestions,
      'manyOfQuestions': instance.manyOfQuestions,
      'exactAnswerQuestions': instance.exactAnswerQuestions,
      'orderQuestions': instance.orderQuestions,
      'isFinished': instance.isFinished,
    };
