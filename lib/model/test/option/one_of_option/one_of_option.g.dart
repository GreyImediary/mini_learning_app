// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_of_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneOfOption _$OneOfOptionFromJson(Map<String, dynamic> json) {
  return OneOfOption(
    json['id'] as int,
    json['text'] as String,
    json['url'] as String?,
    json['isCorrect'] as bool?,
    json['order'] as int?,
  );
}

Map<String, dynamic> _$OneOfOptionToJson(OneOfOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'url': instance.imageUrl,
      'isCorrect': instance.isCorrect,
      'order': instance.order,
    };
