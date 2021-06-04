import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/test_screen/test_screen_bloc.dart';
import 'package:mini_learning_app/bloc/test_screen/test_screen_event.dart';
import 'package:mini_learning_app/bloc/test_screen/test_screen_state.dart';
import 'package:mini_learning_app/model/test/option/one_of_option/one_of_option.dart';
import 'package:mini_learning_app/model/test/question/one_of_question/one_of_question.dart';
import 'package:mini_learning_app/model/test/question_answer_data/answer_data.dart';
import 'package:mini_learning_app/model/test/question_answer_data/one_of_answer_data.dart';

class OneOfQuestionWidget extends StatefulWidget {
  final OneOfQuestion question;

  OneOfQuestionWidget({required this.question});

  @override
  _OneOfQuestionWidgetState createState() => _OneOfQuestionWidgetState();
}

class _OneOfQuestionWidgetState extends State<OneOfQuestionWidget> {
  OneOfOption? _option;

  bool _isCorrectnessShown = false;
  bool _isDisabled = false;

  @override
  Widget build(BuildContext context) {
    final question = widget.question;

    return BlocListener<TestScreenBloc, TestScreenState>(
      listener: (_, state) {
        if (state is TestAnswerAccept) {
          if (_option == null) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Выберете вариант ответа!')));
          } else {
            context.read<TestScreenBloc>().add(TestAnswerSent(getAnswer()));
            _isCorrectnessShown = true;
            _isDisabled = true;
          }
        } else if (state is TestNextQuestion) {
          _isCorrectnessShown = false;
          _isDisabled = false;
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              question.text,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ...question.options.map(
            (option) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: option.render(
                option.id == _option?.id && _isCorrectnessShown,
                _isDisabled,
                _option,
                (value) {
                  setState(() {
                    _option = value;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  AnswerData getAnswer() {
    return OneOfAnswerData(
      widget.question.id,
      _option!.id,
      _option!.isCorrect!,
    );
  }
}
