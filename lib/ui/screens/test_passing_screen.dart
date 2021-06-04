import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/test/test_repository.dart';
import 'package:mini_learning_app/bloc/test_screen/test_screen_bloc.dart';
import 'package:mini_learning_app/bloc/test_screen/test_screen_event.dart';
import 'package:mini_learning_app/bloc/test_screen/test_screen_state.dart';
import 'package:mini_learning_app/model/test/question_answer_data/answer_data.dart';
import 'package:mini_learning_app/model/test/test_data/test.dart';
import 'package:mini_learning_app/shared_preferences/pref_constants.dart';
import 'package:mini_learning_app/shared_preferences/secure_store.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:mini_learning_app/ui/widgets/test_dot.dart';
import 'package:mini_learning_app/ui/widgets/test_final_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class TestPassingScreen extends StatefulWidget {
  final Test test;

  TestPassingScreen(this.test);

  @override
  _TestPassingScreenState createState() => _TestPassingScreenState();
}

class _TestPassingScreenState extends State<TestPassingScreen> {
  List<AnswerData> answerList = [];

  int _questionIndex = 0;
  bool _showNextButton = false;

  double correctAnswerNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => TestScreenBloc(
          widget.test.questions.length,
        ),
        child: BlocConsumer<TestScreenBloc, TestScreenState>(
          listener: (_, state) async {
            if (state is TestFinish) {
              final userId = await SecureStorage.getInt(PrefConst.userId);
              context.read<TestRepository>().finishTest(userId ?? -1, widget.test.id, answerList);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => TestFinalScreen(
                    correctAnswerNumber,
                    answerList.length.toDouble(),
                    widget.test,
                  ),
                ),
              );
            }
          },
          builder: (BuildContext context, state) {
            if (state is TestAnswerSuccess) {
              answerList.add(state.answer);
              _showNextButton = !_showNextButton;

              if (state.answer.isCorrect) {
                correctAnswerNumber++;
              }
            } else if (state is TestNextQuestion) {
              _questionIndex++;
              _showNextButton = !_showNextButton;
            }

            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildHeader(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < widget.test.questions.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: TestDot(
                            color: getDotColor(i),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: widget.test.questions[_questionIndex].render(),
                  ),
                  AnimatedCrossFade(
                    firstChild: IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        context
                            .read<TestScreenBloc>()
                            .add(TestAnswerRequested());
                      },
                    ),
                    secondChild: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        context
                            .read<TestScreenBloc>()
                            .add(TestNextQuestionRequested());
                      },
                    ),
                    crossFadeState: _showNextButton
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Duration(milliseconds: 200),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      height: 164,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: widget.test.imageUrl,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 400),
          ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.45),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              padding: EdgeInsets.all(8),
              constraints: BoxConstraints(),
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.test.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Color getDotColor(int index) {
    if (answerList.length > index) {
      if (answerList[index].isCorrect) {
        return green;
      } else {
        return error;
      }
    } else {
      return testOptionColor;
    }
  }
}
