import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_learning_app/ui/widgets/login_screen_widgets/login_form_panel.dart';

class LoginScreen extends StatelessWidget {
  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MINI\nLearning App',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontFamily: 'MINISerif'),
                  ),
                  Container(
                    child: LoginFormPanel(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset('assets/mini_logo.svg'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
