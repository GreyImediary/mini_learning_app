import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/test/test_event.dart';
import 'package:mini_learning_app/bloc/test/test_repository.dart';
import 'package:mini_learning_app/bloc/test/test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final TestRepository testRepository;

  TestBloc(this.testRepository) : super(TestInitial());

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    if (event is TestsRequested) {
      final articles = await testRepository.getTests();

      yield TestsSuccess(articles);
    } else if (event is TestsReset) {
      yield TestInitial();

      add(TestsRequested());
    } else if (event is TestRequested) {
      final test = await testRepository.getTest(event.id);

      if (test != null) {
        yield TestSuccess(test);
      }
    }
  }
}