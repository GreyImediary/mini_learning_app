import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginButton extends AnimatedWidget {
  final VoidCallback onPressed;
  final Animation<double> animation;

  LoginButton({
    Key? key,
    required this.animation,
    required this.onPressed,
  }) : super(key: key, listenable: animation);

  static final _borderRadiusTween = BorderRadiusTween(
    begin: BorderRadius.circular(16),
    end: BorderRadius.circular(96),
  );

  static final _textOpacityTween = Tween<double>(begin: 1.0, end: 0.0);

  static final _progressIndicatorTween = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    final _widthTween = Tween<double>(begin: MediaQuery.of(context).size.width, end: 36);

    return Material(
      borderRadius: _borderRadiusTween.evaluate(animation),
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        radius: 500,
        onTap: onPressed,
        highlightColor: Colors.transparent,
        borderRadius: _borderRadiusTween.evaluate(animation),
        child: Container(
          width: _widthTween.evaluate(animation),
          height: 36,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: _textOpacityTween.evaluate(animation),
                child: Text(
                  'ВОЙТИ',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: Colors.white,
                        fontFamily: 'MINISansSerifCYR',
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Opacity(
                opacity: _progressIndicatorTween.evaluate(animation),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
