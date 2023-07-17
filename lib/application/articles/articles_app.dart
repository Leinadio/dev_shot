import 'package:dev_shot/application/articles/models/article.dart';
import 'package:dev_shot/application/articles/ports/article_request_port.dart';
import 'package:dev_shot/domain/articles/articles_controller.dart';
import 'package:dev_shot/infra/articles/models/article.dart';
import 'package:dev_shot/infra/articles/adapters/articles_firestore_adapter.dart';
import 'package:dev_shot/infra/article_content/adapters/article_content_storage_adapter.dart';

class ArticlesApplication {
  final IArticleRequest articlesController = ArticlesController(
    dataSource: ArticleFirestoreAdapter(),
    contentAdapter: ArticleContentStorageAdapter(),
  );

  Future<List<Article>> getLastArticles() {
    return articlesController.getLastArticles();
  }

  Future<ArticleApp?> getArticleById({required String id}) {
    return articlesController.getArticleById(id: id);
  }

  Future<List<Article>> getArticleByTitle({required String title}) {
    return articlesController.getArticleByTitle(title: title);
  }
}
