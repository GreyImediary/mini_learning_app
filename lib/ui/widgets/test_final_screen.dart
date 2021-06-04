import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/model/test/test_data/test.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_learning_app/ui/screens/test_passing_screen.dart';

class TestFinalScreen extends StatelessWidget {
  final double correctAnswersNumber;
  final double answerNumber;
  final Test test;

  final int correctnessPercent;

  TestFinalScreen(
    this.correctAnswersNumber,
    this.answerNumber,
    this.test,
  ) : correctnessPercent = (correctAnswersNumber / answerNumber * 100).toInt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Результат теста',
              style: Theme.of(context).textTheme.headline5,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _getFaceIcon(),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: '${correctAnswersNumber.toInt()}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: _getTextColor())),
                      TextSpan(
                        text: ' из ${answerNumber.toInt()}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
                Text(
                  'правильных ответов',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _getText(),
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => TestPassingScreen(test),
                          ),
                        );
                      },
                      child: Text('ПРОЙТИ ЕЩЁ РАЗ'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('ЗАВЕРШИТЬ'),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  Color _getTextColor() {
    if (correctnessPercent >= 75) {
      return green;
    } else if (correctnessPercent <= 25) {
      return error;
    } else {
      return secondary;
    }
  }

  Widget _getFaceIcon() {
    if (correctnessPercent >= 75) {
      return SvgPicture.asset('assets/happy_face.svg');
    } else if (correctnessPercent <= 25) {
      return SvgPicture.asset('assets/sad_face.svg');
    } else {
      return SvgPicture.asset('assets/straight_face.svg');
    }
  }

  String _getText() {
    if (correctnessPercent >= 75) {
      return 'Вы отлично справились с тестом! Продолжайте в том же духе!';
    } else if (correctnessPercent <= 25) {
      return 'Повторите необходимую тему и пройдите тест ещё раз.';
    } else {
      return 'В можете справиться лучше! Повторите пробелы и попоробуйте пройти тест ещё раз.';
    }
  }
}
