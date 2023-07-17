import 'package:dev_shot/infra/articles/models/article.dart';

abstract class IArticlesPort {
  Future<List<Article>> getLastArticles();
  Future<Article?> getArticleById({required String id});
  Future<List<Article>> getArticleByTitle({required String title});
}
