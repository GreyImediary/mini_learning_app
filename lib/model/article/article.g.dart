// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['id'] as int,
    json['title'] as String,
    json['content'] as String,
    json['video'] as String?,
    json['favoriteFor'] as int,
    json['previewUrl'] as String?,
    (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['isFavorite'] as bool,
    json['isFinished'] as bool,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'video': instance.video,
      'favoriteFor': instance.favoriteFor,
      'previewUrl': instance.imageUrl,
      'tags': instance.tags,
      'isFavorite': instance.isFavorite,
      'isFinished': instance.isFinished,
    };
