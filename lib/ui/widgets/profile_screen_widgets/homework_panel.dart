import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeworkPanel extends StatefulWidget {
  final Icon icon;
  final String title;

  HomeworkPanel({
    required this.icon,
    required this.title,
  });

  @override
  _HomeworkPanelState createState() => _HomeworkPanelState();
}

class _HomeworkPanelState extends State<HomeworkPanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isHomeworkVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isHomeworkVisible) {
          _controller.reverse();
        } else {
          _controller.forward();
        }

        setState(() {
          _isHomeworkVisible = !_isHomeworkVisible;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color.fromRGBO(207, 218, 250, 1.0),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.icon,
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Icon(
                    _isHomeworkVisible ? Icons.expand_less : Icons.expand_more),
              ],
            ),
            SizeTransition(
              sizeFactor: _controller.drive(
                CurveTween(curve: Curves.fastOutSlowIn),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [],
                ),
              ),
            ),
          ],
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
