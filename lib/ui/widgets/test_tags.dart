import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mini_learning_app/ui/widgets/exercise_card.dart';
import 'package:mini_learning_app/ui/widgets/test_card.dart';

class TestTag extends StatefulWidget {
  @override
  _TestTagState createState() => _TestTagState();
}

class _TestTagState extends State<TestTag> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _sizeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _rotationAnimation = Tween<double>(begin: 0, end: 0.5)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: StaggeredGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              ExerciseCard(),
              ExerciseCard(),
              ExerciseCard(),
              TestCard()
            ],
            staggeredTiles: [
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
            ],
          ),
        ),
      ),
    );
  }
}
