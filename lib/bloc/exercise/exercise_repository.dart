import 'package:dio/dio.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/model/exercise/exercise_card_data/exercise_card_data.dart';

class ExerciseRepository {
  final Dio dio;
  final PageHandler pageHandler;

  ExerciseRepository(this.dio, this.pageHandler);

  Future<List<ExerciseCardData>> getExercises() async {
    try {
      final response = await dio.post(
        '/exercise/getMany',
        queryParameters: {'page': pageHandler.page, 'perPage': pageHandler.perPage},
      );

      final jsonExercises = response.data as List?;

      if (jsonExercises != null) {
        final exercises = jsonExercises
            .map(
              (jsonExercise) => ExerciseCardData.fromJson(jsonExercise),
        )
            .toList();

        if (exercises.isNotEmpty) {
          pageHandler.incrementPage();
        }

        return exercises;
      }

      return [];
    } on DioError {
      return [];
    }
  }
}