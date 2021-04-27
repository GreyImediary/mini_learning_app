// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['firstName'] as String,
    json['lastName'] as String,
    json['email'] as String,
    json['company'] as String,
    (json['rating'] as num).toDouble(),
    json['finishedArticles'] as int,
    json['finishedTests'] as int,
    json['favoriteArticles'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'company': instance.company,
      'rating': instance.rating,
      'finishedArticles': instance.finishedArticles,
      'finishedTests': instance.finishedTests,
      'favoriteArticles': instance.favoriteArticles,
    };
