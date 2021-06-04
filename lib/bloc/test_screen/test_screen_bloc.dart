import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/test_screen/test_screen_event.dart';
import 'package:mini_learning_app/bloc/test_screen/test_screen_state.dart';

class TestScreenBloc extends Bloc<TestScreenEvent, TestScreenState> {
  final int testSize;
  int _index = 0;


  TestScreenBloc(this.testSize) : super(TestScreenInitial());

  @override
  Stream<TestScreenState> mapEventToState(TestScreenEvent event) async* {
    if (event is TestNextQuestionRequested) {
      yield await mapTestNextQuestionRequested();
    } else if (event is TestAnswerRequested) {
      yield TestAnswerAccept();
    } else if (event is TestAnswerSent) {
      yield TestAnswerSuccess(event.answer);
    }
  }

  Future<TestScreenState> mapTestNextQuestionRequested() async {
    ++_index;
    if (_index < testSize) {
      return TestNextQuestion(_index);
    } else {
      return TestFinish();
    }
  }
}