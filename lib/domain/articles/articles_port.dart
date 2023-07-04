import 'package:dev_shot/domain/models/article.dart';

abstract class IArticlesPort {
  Future<List<Article>> getArticles();
}
