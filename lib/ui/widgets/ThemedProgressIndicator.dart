import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemedProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
