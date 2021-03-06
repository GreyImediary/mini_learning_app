import 'package:json_annotation/json_annotation.dart';
import 'package:mini_learning_app/model/tag/tag.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final int id;
  final String title;
  final String content;
  final String? video;
  final int favoriteFor;
  @JsonKey(name: 'previewUrl')
  final String? imageUrl;
  final List<Tag> tags;
  bool isFavorite;
  bool isFinished;

  Article(
      this.id,
      this.title,
      this.content,
      this.video,
      this.favoriteFor,
      this.imageUrl,
      this.tags,
      this.isFavorite,
      this.isFinished
      );

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
