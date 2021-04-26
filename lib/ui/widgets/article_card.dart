import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/ui/widgets/tag.dart';
import 'package:mini_learning_app/ui/widgets/tag_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleCard extends StatefulWidget {
  final bool isNews;

  ArticleCard(this.isNews);

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard>
    with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
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
                        height: 100,
                      ),
                    ),
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                      'https://images.drive.ru/i/0/59786698ec05c4365e000006.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                      fadeInDuration: Duration(milliseconds: 400),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                  bottom: widget.isNews ? 16 : 8
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Название статьи',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Супер пупер описание статьи на несколько строк раз два три четыре',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Tag(
                              text: 'Ты',
                              onTap: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Tag(
                              text: 'Очень длинный тэг',
                              onTap: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Tag(
                              text: 'Ты',
                              onTap: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Tag(
                              text: 'Очень длинный тэг',
                              onTap: () {},
                            ),
                          ),
                        ),
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
                          Tag(text: 'Я очень длинный тэг'),
                          Tag(text: 'Я очень длинный тэг'),
                        ],
                      ),
                    ),
                    if (!widget.isNews)
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashRadius: 20,
                          icon: Icon(
                            Icons.bookmark_outline,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {},
                        ),
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
