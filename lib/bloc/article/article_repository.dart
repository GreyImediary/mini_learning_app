import 'package:dio/dio.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/model/article/article.dart';

class ArticleRepository {
  final Dio dio;
  final PageHandler pageHandler;

  ArticleRepository(this.dio, this.pageHandler);

  Future<List<Article>> getArticles() async {
    try {
      final response = await dio.post(
        '/article/getMany',
        data: {'page': pageHandler.page, 'perPage': pageHandler.perPage},
      );

      final jsonArticles = response.data['data'] as List?;

      if (jsonArticles != null) {
        final articles = jsonArticles
            .map(
              (jsoArticle) => Article.fromJson(jsoArticle),
            )
            .toList();

        if (articles.isNotEmpty) {
          pageHandler.incrementPage();
        }

        return articles;
      }

      return [];
    } on DioError {
      return [];
    }
  }
}
