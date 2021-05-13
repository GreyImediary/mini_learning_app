import 'package:dio/dio.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/model/test/test_card_data/test_card_data.dart';

class TestRepository {
  final Dio dio;
  final PageHandler pageHandler;

  TestRepository(this.dio, this.pageHandler);

  Future<List<TestCardData>> getTests() async {
    try {
      final response = await dio.post(
        '/test/getMany',
        data: {'page': pageHandler.page, 'perPage': pageHandler.perPage},
      );

      final jsonTests = response.data['data'] as List?;

      if (jsonTests != null) {
        final tests = jsonTests
            .map(
              (jsoArticle) => TestCardData.fromJson(jsoArticle),
        )
            .toList();

        if (tests.isNotEmpty) {
          pageHandler.incrementPage();
        }

        return tests;
      }

      return [];
    } on DioError {
      return [];
    }
  }
}