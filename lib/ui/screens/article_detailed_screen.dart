import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mini_learning_app/bloc/user/user_bloc.dart';
import 'package:mini_learning_app/bloc/user/user_event.dart';
import 'package:mini_learning_app/bloc/user/user_state.dart';
import 'package:mini_learning_app/model/article/article.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ArticleDetailedScreen extends StatefulWidget {
  final Article article;

  ArticleDetailedScreen(this.article);

  @override
  _ArticleDetailedScreenState createState() => _ArticleDetailedScreenState();
}

class _ArticleDetailedScreenState extends State<ArticleDetailedScreen> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.article.video ?? '') ?? '';
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final article = widget.article;
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (_, state) {
          if (state is UserArticleSaveSuccess &&
              article.id == state.articleId) {
            setState(() {
              article.isFavoriteForCurrent = true;
            });
          } else if (state is UserArticleSaveFail) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Не удалось сохранить статью :(')),
            );
          }
        },
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Theme.of(context).colorScheme.secondary,
          ),
          builder: (context, player) {
            return ListView(children: [
              Container(
                height: 164,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: article.imageUrl,
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 400),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 0, 0, 0.45),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.all(8),
                        constraints: BoxConstraints(),
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                article.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              splashRadius: 20,
                              icon: Icon(
                                article.isFavoriteForCurrent
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                              onPressed: () {
                                context
                                    .read<UserBloc>()
                                    .add(UserArticleSaved(article.id));
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (article.video != null) player,
              Html(data: article.content),
            ]);
          },
        ),
      ),
    );
  }
}
