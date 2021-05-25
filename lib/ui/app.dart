import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/auth/auth_bloc.dart';
import 'package:mini_learning_app/bloc/auth/auth_repository.dart';
import 'package:mini_learning_app/bloc/user/user_repository.dart';
import 'package:mini_learning_app/ui/app_view.dart';

class App extends StatelessWidget {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  const App({
    Key? key,
    required this.authRepository,
    required this.userRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: userRepository)
      ],
      child: BlocProvider(
        lazy: false,
        create: (BuildContext context) => AuthBloc(
          authRepository: authRepository,
        ),
        child: AppView(),
      ),
    );
  }
}
