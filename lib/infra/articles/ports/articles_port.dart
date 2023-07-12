import 'package:dev_shot/infra/articles/models/article.dart';

abstract class IArticlesPort {
  Future<List<Article>> getLastArticles();
  Future<List<Article>> getPrerequisite({required String id});
  Future<Article?> getArticleById({required String id});
}
