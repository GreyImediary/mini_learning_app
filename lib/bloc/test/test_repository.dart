import 'package:dio/dio.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/model/test/finished_test/finished_test.dart';
import 'package:mini_learning_app/model/test/question_answer_data/answer_data.dart';
import 'package:mini_learning_app/model/test/question_answer_data/one_of_answer_data.dart';
import 'package:mini_learning_app/model/test/test_card_data/test_card_data.dart';
import 'package:mini_learning_app/model/test/test_data/test.dart';

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

  Future<Test?> getTest(int id) async {
    try {
      final response = await dio.get('/test/$id');

      return Test.fromJson(response.data);
    } on DioError {
      return null;
    }
  }

  Future<bool> finishTest(int userId, int testId, List<AnswerData> answers) async {
    try {
      final List<OneOfAnswerData> oneOfAnswers = [];
      
      answers.forEach((element) { 
        if (element is OneOfAnswerData) {
          oneOfAnswers.add(element);
        }
      });
      
      final finishedTest = FinishedTest(userId, testId, oneOfAnswers);
      
      final response = await dio.post('/finished-test', data: finishedTest.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }

    } on DioError {
      return false;
    }
  }
  
}