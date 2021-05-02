import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String company;
  final double? rating;
  final int finishedArticles;
  final int finishedTests;
  final int favoriteArticles;

  User(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.company,
      this.rating,
      this.finishedArticles,
      this.finishedTests,
      this.favoriteArticles);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}