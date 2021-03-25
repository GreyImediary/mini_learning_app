import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/ui/widgets/login_screen_widgets/login_button.dart';

class LoginFormPanel extends StatefulWidget {
  @override
  _LoginFormPanelState createState() => _LoginFormPanelState();
}

class _LoginFormPanelState extends State<LoginFormPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Почта',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                  ),
                  obscureText: true,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64),
          child: LoginButton(
            animation: _controller,
            onPressed: () {
              _controller.forward();
            },
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Забыли пароль?'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
