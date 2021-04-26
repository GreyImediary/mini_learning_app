import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:mini_learning_app/ui/widgets/tag_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mini_learning_app/ui/widgets/tag.dart';
import 'package:transparent_image/transparent_image.dart';

class TestCard extends StatefulWidget {
  @override
  _TestCardState createState() => _TestCardState();
}

class _TestCardState extends State<TestCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotationAnimation;

  bool _isTestFinished = false;

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
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.green,
                        height: 56,
                      ),
                    ),
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          'https://images.drive.ru/i/0/59786698ec05c4365e000006.jpg',
                      fit: BoxFit.cover,
                      height: 56,
                      fadeInDuration: Duration(milliseconds: 400),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Название теста',
                      style: Theme.of(context).textTheme.subtitle2
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Tag(
                            text: 'Ты',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Tag(
                            text: 'Очень длинный тэг',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TagButton(
                            rotationAnimation: _rotationAnimation,
                            onTap: () {
                              if (_controller.status ==
                                  AnimationStatus.completed) {
                                _controller.reverse();
                              } else {
                                _controller.forward();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizeTransition(
                      sizeFactor: _sizeAnimation,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Tag(text: 'Привет'),
                          Tag(text: 'Я тэг'),
                          Tag(text: 'Дргуой тэг'),
                          Tag(text: 'Я длинн')
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.not_listed_location),
                            Text('5'),
                          ],
                        ),
                        AnimatedOpacity(
                          opacity: _isTestFinished ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 300),
                          child: Icon(
                            Icons.verified,
                            color: green,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}