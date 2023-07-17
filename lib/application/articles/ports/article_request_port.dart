import 'package:dev_shot/application/articles/models/article.dart';
import 'package:dev_shot/infra/articles/models/article.dart';

abstract class IArticleRequest {
  Future<List<Article>> getLastArticles();
  Future<ArticleApp?> getArticleById({required String id});
  Future<List<Article>> getArticleByTitle({required String title});
}
