import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/article/article_event.dart';
import 'package:mini_learning_app/bloc/article/article_repository.dart';
import 'package:mini_learning_app/bloc/article/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;

  ArticleBloc(this.articleRepository) : super(ArticleInitial());

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is ArticlesRequested) {
      final articles = await articleRepository.getArticles();

      yield ArticlesSuccess(articles);
    } else if (event is ArticlesReset) {
      yield ArticleInitial();
      
      add(ArticlesRequested());
    }
  }
}