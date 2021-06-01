import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class TestDot extends StatelessWidget {
  final Color color;
  final double size;

  TestDot({required this.color, this.size = 15.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}
