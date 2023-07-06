import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/domain/articles/articles_controller.dart';
import 'package:dev_shot/infra/firestore/articles_adapter.dart';

class ArticleApplication {
  final articlesController = ArticlesController(dataSource: ArticleFirestoreAdapter());

  Future<List<Article>> getLastArticles() {
    return articlesController.getLastArticles();
  }

  Future<List<Article>?> getPrerequisite({required String id}) {
    return articlesController.getPrerequisite(id: id);
  }

  Future<Article?> getArticleById({required String id}) {
    return articlesController.getArticleById(id: id);
  }

  getFavoriteArticle() {}
}
