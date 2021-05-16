import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/model/exercise/exercise_card_data/exercise_card_data.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class ExerciseCard extends StatefulWidget {
  final ExerciseCardData exerciseCardData;

  ExerciseCard(this.exerciseCardData);

  @override
  ExerciseCardState createState() => ExerciseCardState();
}

class ExerciseCardState extends State<ExerciseCard>
    with SingleTickerProviderStateMixin {

  bool _hasDoneTasks = true;

  @override
  Widget build(BuildContext context) {
    final exerciseData = widget.exerciseCardData;

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
                      image: exerciseData.imageUrl ?? '',
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
                      exerciseData.title,
                      style: Theme.of(context).textTheme.subtitle2
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.filter_none, size: 16,),
                            const SizedBox(width: 4,),
                            Text('${exerciseData.articleCount + exerciseData.testCount}'),
                          ],
                        ),
                        AnimatedOpacity(
                          opacity: _hasDoneTasks ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 300),
                          child: Container(
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 10
                            ),
                            child: Text(
                              '100%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )
                            ),
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
}
