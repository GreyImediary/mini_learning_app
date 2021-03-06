import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/auth/auth_bloc.dart';
import 'package:mini_learning_app/bloc/auth/auth_repository.dart';
import 'package:mini_learning_app/bloc/auth/auth_state.dart';
import 'package:mini_learning_app/ui/widgets/login_screen_widgets/login_button.dart';

class LoginFormPanel extends StatefulWidget {
  @override
  _LoginFormPanelState createState() => _LoginFormPanelState();
}

class _LoginFormPanelState extends State<LoginFormPanel>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late TextEditingController _emailController;
  late TextEditingController _passController;

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
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context
            .read<AuthRepository>()
            .login(_emailController.text, _passController.text);
      }
    });

    _emailController = TextEditingController();
    _passController = TextEditingController();

    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure || state is AuthSuccess) {
          _controller.reverse();

          setState(() {
            _isFormEnabled = !_isFormEnabled;
          });
        }
      },
      child: Column(
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
                        return '?????????????? ?????????? ??????????';
                      } else if (!_emailRegExp.hasMatch(email)) {
                        return '???????????????? ???????? ??????????';
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
                      labelText: '??????????',
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
                    controller: _passController,
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return '?????????????? ????????????';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: '????????????',
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
                  _controller.forward();

                  setState(() {
                    _isFormEnabled = !_isFormEnabled;
                  });

                }
              },
            ),
          ),
          Opacity(
            opacity: 0.0,
            child: TextButton(
              onPressed: _isFormEnabled ? () {} : null,
              child: Text('???????????? ?????????????'),
            ),
          ),
        ],
      ),
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
