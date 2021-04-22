import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/ui/widgets/login_screen_widgets/login_button.dart';

class LoginFormPanel extends StatefulWidget {
  @override
  _LoginFormPanelState createState() => _LoginFormPanelState();
}

class _LoginFormPanelState extends State<LoginFormPanel>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late TextEditingController _emailController;

  late FocusNode _passwordFocusNode;

  bool _isClearVisible = false;
  bool _isPassObscured = true;
  bool _isFormEnabled = true;

  final _emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _emailController = TextEditingController();

    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  enabled: _isFormEnabled,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Введите адрес почты';
                    } else if (!_emailRegExp.hasMatch(email)) {
                      return 'Неверный ввод почты';
                    }

                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      if (text.isNotEmpty) {
                        _isClearVisible = true;
                      } else {
                        _isClearVisible = false;
                      }
                    });
                  },
                  onFieldSubmitted: (text) {
                    _passwordFocusNode.requestFocus();
                  },
                  decoration: InputDecoration(
                    labelText: 'Почта',
                    suffixIcon: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _isClearVisible ? 1.0 : 0.0,
                      child: IconButton(
                        icon: Icon(Icons.cancel),
                        splashRadius: 20,
                        onPressed: () {
                          _emailController.clear();
                          setState(() {
                            _isClearVisible = false;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  enabled: _isFormEnabled,
                  textInputAction: TextInputAction.done,
                  obscureText: _isPassObscured,
                  focusNode: _passwordFocusNode,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Введите пароль';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Пароль',
                      suffixIcon: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedCrossFade(
                            firstChild: IconButton(
                              icon: Icon(Icons.visibility),
                              splashRadius: 20,
                              onPressed: () {
                                setState(() {
                                  _isPassObscured = false;
                                });
                              },
                            ),
                            secondChild: IconButton(
                              icon: Icon(Icons.visibility_off),
                              splashRadius: 20,
                              onPressed: () {
                                setState(() {
                                  _isPassObscured = true;
                                });
                              },
                            ),
                            crossFadeState: _isPassObscured
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: Duration(milliseconds: 200),
                          )
                        ],
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: LoginButton(
            animation: _controller,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (_controller.isCompleted) {
                  _controller.reverse();
                  setState(() {
                    _isFormEnabled = true;
                  });
                } else {
                  _controller.forward();
                  setState(() {
                    _isFormEnabled = false;
                  });
                }
              }
            },
          ),
        ),
        TextButton(
          onPressed: _isFormEnabled ? () {} : null,
          child: Text('Забыли пароль?'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
