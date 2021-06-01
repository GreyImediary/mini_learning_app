// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_of_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneOfQuestion _$OneOfQuestionFromJson(Map<String, dynamic> json) {
  return OneOfQuestion(
    json['id'] as String,
    json['type'] as String,
    json['text'] as String,
    json['order'] as int,
    (json['options'] as List<dynamic>)
        .map((e) => OneOfOption.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OneOfQuestionToJson(OneOfQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'text': instance.text,
      'order': instance.order,
      'options': instance.options,
    };
