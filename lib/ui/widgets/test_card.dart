import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/model/tag/tag.dart';
import 'package:mini_learning_app/model/test/test_card_data/test_card_data.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:mini_learning_app/ui/widgets/tag_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mini_learning_app/ui/widgets/tag.dart';
import 'package:transparent_image/transparent_image.dart';

class TestCard extends StatefulWidget {
  final TestCardData testCardData;
  final VoidCallback onTap;


  TestCard({required this.testCardData, required this.onTap});

  @override
  _TestCardState createState() => _TestCardState();
}

class _TestCardState extends State<TestCard>
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
    final testData = widget.testCardData;
    final questionCount =
        widget.testCardData.exactAnswerQuestions +
            widget.testCardData.manyOfQuestions +
            widget.testCardData.oneOfQuestions +
            widget.testCardData.orderQuestions;
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      color: Theme
          .of(context)
          .colorScheme
          .surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: widget.onTap,
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
                      image: testData.imageUrl ?? '',
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
                        testData.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle2
                    ),
                    const SizedBox(height: 8),
                    _buildTags(testData.tags),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.not_listed_location),
                            Text('$questionCount'),
                          ],
                        ),
                        AnimatedOpacity(
                          opacity: testData.isFinished ? 1.0 : 0.0,
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

  Widget _buildTags(List<Tag> tags) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (tags.length > 4)
              ...tags
                  .sublist(0, 4)
                  .map(
                    (tag) =>
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TagWidget(
                          text: tag.text,
                          onTap: () {},
                        ),
                      ),
                    ),
              )
                  .toList(),
            if (tags.length <= 4)
              ...tags
                  .map(
                    (tag) =>
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TagWidget(
                          text: tag.text,
                          onTap: () {},
                        ),
                      ),
                    ),
              )
                  .toList(),
            if (tags.length > 4)
              Expanded(
                child: TagButton(
                  rotationAnimation: _rotationAnimation,
                  onTap: () {
                    if (_controller.status == AnimationStatus.completed) {
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
        if (tags.length > 4)
          SizeTransition(
            sizeFactor: _sizeAnimation,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...tags.sublist(4, tags.length).map(
                      (tag) =>
                      TagWidget(
                        text: tag.text,
                        onTap: () {},
                      ),
                ),
              ],
            ),
          ),
      ],
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}