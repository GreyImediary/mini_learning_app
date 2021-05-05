import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/ui/colors.dart';

class TagWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  TagWidget({
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: Material(
        color: tagColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              overflow: TextOverflow.fade,
              softWrap: false,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
