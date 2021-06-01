import 'package:flutter/material.dart';
import 'package:mini_learning_app/model/test/option/one_of_option/one_of_option.dart';
import 'package:mini_learning_app/model/test/question/one_of_question/one_of_question.dart';
import 'package:mini_learning_app/ui/theme_data.dart';
import 'package:mini_learning_app/ui/widgets/test_widgets/question_widget/one_of_question_widget.dart';

class TestTest extends StatefulWidget {
  @override
  _TestTestState createState() => _TestTestState();
}

class _TestTestState extends State<TestTest> {
  String? stringValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  OneOfQuestionWidget(
                    question: OneOfQuestion(
                      'asdasd-asda-asdf',
                      'onOf',
                      'Hello, Fucking Slave',
                      1,
                      [
                        OneOfOption(1, 'Hello', null, false, null),
                        OneOfOption(2, 'Hello world', null, false, null),
                        OneOfOption(3, 'Hello Fucking', null, false, null),
                        OneOfOption(4, 'Hello Fucking Slave', null, true, null),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
