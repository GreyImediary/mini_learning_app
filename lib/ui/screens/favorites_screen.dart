import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/favorites/favorites_bloc.dart';
import 'package:mini_learning_app/bloc/favorites/favorites_event.dart';
import 'package:mini_learning_app/bloc/favorites/favorites_repository.dart';
import 'package:mini_learning_app/bloc/favorites/favorites_state.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/bloc/user/user_bloc.dart';
import 'package:mini_learning_app/bloc/user/user_state.dart';
import 'package:mini_learning_app/dio_client.dart';
import 'package:mini_learning_app/model/article/article.dart';
import 'package:mini_learning_app/ui/widgets/ThemedProgressIndicator.dart';
import 'package:mini_learning_app/ui/widgets/article_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoritesScreen extends StatefulWidget {
  final int userId;

  FavoritesScreen({required this.userId});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final articles = <Article>[];
  late RefreshController _controller;

  @override
  void initState() {
    _controller = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранные'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (_, state) {
          if (state is UserArticleDeleteSuccess) {
            setState(() {
              articles.removeWhere((element) => element.id == state.articleId);
            });
          }
        },
        child: BlocProvider(
          create: (context) => FavoritesBloc(
            FavoritesRepository(
              DioClient.dio,
              PageHandler(),
            ),
          )..add(FavoritesRequested()),
          child: BlocConsumer<FavoritesBloc, FavoritesState>(
            listener: (_, state) {
              if (state is FavoritesSuccess) {
                articles.addAll(state.favorites);
              }
            },
            builder: (context, state) {
              if (state is FavoritesInitial) {
                return Center(
                  child: ThemedProgressIndicator(),
                );
              } else {
                return SafeArea(
                  child: Center(
                    child: SmartRefresher(
                      enablePullUp: true,
                      onRefresh: () {
                        context.read<FavoritesBloc>().add(FavoritesReset());
                        _controller.refreshCompleted();
                      },
                      onLoading: () {
                        context.read<FavoritesBloc>().add(FavoritesRequested());
                        _controller.loadComplete();
                      },
                      controller: _controller,
                      child: articles.isNotEmpty
                          ? _showArticles()
                          : _showNoFavoritesContent(context),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _showArticles() {
    return ListView(
      children: [
        ...articles
            .map((article) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: ArticleCard(article),
                ))
            .toList()
      ],
    );
  }

  Widget _showNoFavoritesContent(BuildContext context) {
    return Center(
      child: Text(
        'У Вас нет сохранённых статей :(',
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
