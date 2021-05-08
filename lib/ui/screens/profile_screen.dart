import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/auth/auth_repository.dart';
import 'package:mini_learning_app/bloc/profile/profile_bloc.dart';
import 'package:mini_learning_app/bloc/profile/profile_event.dart';
import 'package:mini_learning_app/bloc/profile/profile_state.dart';
import 'package:mini_learning_app/bloc/user/user_repository.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:mini_learning_app/ui/widgets/ThemedProgressIndicator.dart';
import 'package:mini_learning_app/ui/widgets/profile_screen_widgets/homework_panel.dart';
import 'package:mini_learning_app/ui/widgets/profile_screen_widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepo = context.read<UserRepository>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {
            context.read<AuthRepository>().logout();
          })
        ],
      ),
      body: BlocProvider(
          create: (_) => ProfileBloc(userRepo)..add(ProfileUserRequested()),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (_, state) {
              if (state is ProfileInitial) {
                return Center(
                  child: ThemedProgressIndicator(),
                );
              } else if (state is ProfileSuccess) {
                final user = state.user;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileCard(user),
                        const SizedBox(height: 48),
                        Text(
                          'Домашние задания',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontSize: 24),
                        ),
                        const SizedBox(height: 21),
                        HomeworkPanel(
                          icon: Icon(
                            Icons.cancel_rounded,
                            color: error,
                          ),
                          title: 'Просрочено',
                        ),
                        const SizedBox(height: 16),
                        HomeworkPanel(
                          icon: Icon(
                            Icons.do_disturb_on_rounded,
                            color: secondary,
                          ),
                          title: 'Задано',
                        ),
                        const SizedBox(height: 16),
                        HomeworkPanel(
                          icon: Icon(
                            Icons.check_circle,
                            color: green,
                          ),
                          title: 'Сделано',
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text('Не удалось получить данные пользоваиеля :('),
                );
              }
            },
          )),
    );
  }
}
