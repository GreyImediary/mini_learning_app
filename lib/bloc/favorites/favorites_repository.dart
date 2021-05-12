import 'package:dio/dio.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/model/article/article.dart';

class FavoritesRepository {
  final Dio dio;
  final PageHandler pageHandler;

  FavoritesRepository(this.dio, this.pageHandler);

  Future<List<Article>> getFavorites() async {
    try {
      final response = await dio.get(
        '/user/articles/favorite',
        queryParameters: {'page': pageHandler.page, 'perPage': pageHandler.perPage},
      );

      final jsonArticles = response.data as List?;

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
