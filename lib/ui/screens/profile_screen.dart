
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_learning_app/ui/colors.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      offset: Offset(0, 3),
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                'https://media1.popsugar-assets.com/files/thumbor/jKkbCQ8LWZRDCrZy7BwRDsKAtNQ/0x139:3825x2147/fit-in/1200x630/filters:format_auto-!!-:strip_icc-!!-/2021/03/05/695/n/1922283/89281b7a6042513104a732.15551095_.jpg',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                            fadeInDuration: Duration(milliseconds: 400),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ральф Боунер',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Московский дилерский центр',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'bohner@gmail.com',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(4),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.bookmark,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(4),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.leaderboard,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(4),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            splashColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.settings,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'Домашние задания',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 21),
              GestureDetector(
                onTap: (){},
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.cancel,
                        color: error,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          'Просрочено',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Icon(Icons.expand_more),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: (){},
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.do_disturb_on_rounded,
                        color: secondary,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          'Задано',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Icon(Icons.expand_more),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: (){},
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
                          Icon(
                            Icons.check_circle,
                            color: green,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Сделано',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Icon(Icons.expand_more),
                        ],
                      ),
                    ],
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
