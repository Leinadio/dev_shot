import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/domain/articles/articles_controller.dart';
import 'package:dev_shot/infra/firestore/articles_adapter.dart';

class ArticleApplication {
  final articlesController = ArticlesController(dataSource: ArticleFirestoreAdapter());

  Future<List<Article>> getArticles() {
    return articlesController.getArticles();
  }

  getLastArticles() {}

  getArticleBy() {}

  getFavoriteArticle() {}
}
