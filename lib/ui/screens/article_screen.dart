import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/article/article_bloc.dart';
import 'package:mini_learning_app/bloc/article/article_event.dart';
import 'package:mini_learning_app/bloc/article/article_repository.dart';
import 'package:mini_learning_app/bloc/article/article_state.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/dio_client.dart';
import 'package:mini_learning_app/model/article/article.dart';
import 'package:mini_learning_app/ui/widgets/ThemedProgressIndicator.dart';
import 'package:mini_learning_app/ui/widgets/article_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
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
        title: Text('Статьи'),
      ),
      body: BlocProvider(
        create: (context) => ArticleBloc(
          ArticleRepository(
            DioClient.dio,
            PageHandler(),
          ),
        )..add(ArticlesRequested()),
        child: BlocConsumer<ArticleBloc, ArticleState>(
          listener: (_, state) {
            if (state is ArticlesSuccess) {
              articles.addAll(state.articles);
            }
          },
          builder: (context, state) {
            if (state is ArticleInitial) {
              return Center(
                child: ThemedProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Center(
                  child: SmartRefresher(
                    enablePullUp: true,
                    onRefresh: () {
                      context.read<ArticleBloc>().add(ArticlesReset());
                      _controller.refreshCompleted();
                    },
                    onLoading: () {
                      context.read<ArticleBloc>().add(ArticlesRequested());
                      _controller.loadComplete();
                    },
                    controller: _controller,
                    child: articles.isNotEmpty
                        ? _showArticles()
                        : _showNoArticlesContent(context),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _showArticles() {
    return ListView(
      children: [
        ...articles.map((article) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: ArticleCard(article),
        )).toList()
      ],
    );
  }

  Widget _showNoArticlesContent(BuildContext context) {
    return Center(
      child: Text(
        'К сожалению, в данный момент нет статей :(',
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
