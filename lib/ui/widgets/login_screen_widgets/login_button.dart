import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginButton extends AnimatedWidget {
  final double width;
  final double height;

  final VoidCallback onPressed;
  final Animation<double> animation;

  final Animatable<BorderRadius> _borderRadiusTween;
  final Animatable<double> _textOpacityTween;
  final Animatable<double> _progressIndicatorOpacityTween;
  final Animatable<double> _widthTween;

  LoginButton({
    Key? key,
    this.width = 200,
    this.height = 36,
    required this.animation,
    required this.onPressed,
  })   : _textOpacityTween = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).chain(
          CurveTween(
            curve: Interval(0, 0.75, curve: Curves.easeInOut),
          ),
        ),
        _progressIndicatorOpacityTween = Tween<double>(
          begin: 0,
          end: 1,
        ).chain(
            CurveTween(
              curve: Interval(0.75, 1, curve: Curves.easeInOut),
            ),
        ),
        _widthTween = Tween<double>(
          begin: width,
          end: height,
        ).chain(
            CurveTween(
              curve: Interval(0, 0.75, curve: Curves.easeInBack),
            ),
        ),
        _borderRadiusTween = BorderRadiusTween(
          begin: BorderRadius.circular(16),
          end: BorderRadius.circular(height),
        ).chain(
          CurveTween(
            curve: Interval(0.5, 0.75, curve: Curves.easeInOut),
          ),
        ),
        super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
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
          height: height,
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
                opacity: _progressIndicatorOpacityTween.evaluate(animation),
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
