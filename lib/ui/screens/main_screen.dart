import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/user/user_bloc.dart';
import 'package:mini_learning_app/bloc/user/user_repository.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:mini_learning_app/ui/screens/article_screen.dart';
import 'package:mini_learning_app/ui/screens/exercise_screen.dart';
import 'package:mini_learning_app/ui/screens/news_screen.dart';
import 'package:mini_learning_app/ui/screens/profile_screen.dart';
import 'package:mini_learning_app/ui/screens/test_screen.dart';

class MainScreen extends StatefulWidget {
  final _screenList = [
    ExerciseScreen(),
    TestScreen(),
    ArticleScreen(),
    NewsScreen(),
    ProfileScreen(),
  ];

  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MainScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => UserBloc(context.read<UserRepository>()),
        child: SafeArea(
          child: BottomBarPageTransition(
            builder: (context, index) => widget._screenList[index],
            currentIndex: _currentIndex,
            totalLength: 5,
            transitionType: TransitionType.fade,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomTapped,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: primary,
            icon: Icon(Icons.fitness_center),
            label: 'Упражнения',
          ),
          BottomNavigationBarItem(
            backgroundColor: primary,
            icon: Icon(Icons.help),
            label: 'Тесты',
          ),
          BottomNavigationBarItem(
            backgroundColor: primary,
            icon: Icon(Icons.text_snippet),
            label: 'Статьи',
          ),
          BottomNavigationBarItem(
            backgroundColor: primary,
            icon: Icon(Icons.campaign),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            backgroundColor: primary,
            icon: Icon(Icons.person),
            label: 'Профлиь',
          ),
        ],
      ),
    );
  }

  _onBottomTapped(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }
}
