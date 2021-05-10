import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/auth/auth_bloc.dart';
import 'package:mini_learning_app/bloc/auth/auth_event.dart';
import 'package:mini_learning_app/bloc/auth/auth_repository.dart';
import 'package:mini_learning_app/bloc/auth/auth_state.dart';
import 'package:mini_learning_app/help_functions/snack_bar_helpers.dart';
import 'package:mini_learning_app/ui/screens/login_screen.dart';
import 'package:mini_learning_app/ui/screens/main_screen.dart';
import 'package:mini_learning_app/ui/screens/splash_screen.dart';
import 'package:mini_learning_app/ui/theme_data.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'MINI Learning App',
      theme: theme,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listenWhen: (previousState, current) => true,
          listener: (context, state) {
            if (state is AuthLogin) {
              _toScreen(LoginScreen.route());
            } else if (state is AuthSuccess) {
              _toScreen(MainScreen.route());
            } else if (state is AuthFailure) {
              _handleError(context, state.message, state.status);
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashScreen.route(),
    );
  }

  void _toScreen(Route route) {
    _navigator.pushAndRemoveUntil(
      route,
      (route) => false,
    );
  }

  _handleError(BuildContext context, String message, AuthStatus status) {
    switch (status) {
      case AuthStatus.unauthenticated:
        showSimpleSnackBar(context, message);
        context.read<AuthBloc>().add(AuthStatusChanged(status));
        break;
      case AuthStatus.loginError:
        showSimpleSnackBar(context, message);
        break;
      case AuthStatus.refreshError:
        showSimpleSnackBar(context, message);
        context.read<AuthBloc>().add(AuthStatusChanged(AuthStatus.unauthenticated,));
        break;
      default:
        break;
    }
  }
}
