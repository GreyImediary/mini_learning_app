import 'package:flutter/material.dart';

class TagButton extends StatelessWidget {
  final Animation<double> rotationAnimation;
  final VoidCallback? onTap;

  TagButton({required this.rotationAnimation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(237, 237, 237, 1.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          child: RotationTransition(
            turns: rotationAnimation,
            child: Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
