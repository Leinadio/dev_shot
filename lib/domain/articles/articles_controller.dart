import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/domain/articles/articles_port.dart';

class ArticlesController {
  ArticlesController({required this.dataSource});
  final IArticlesPort dataSource;

  Future<List<Article>> getLastArticles() async {
    // Retourner le model en future dans
    // vu qu'on ne sait pas qu'elle database il y a derrière on peut le changer ça ne changera pas le comportement
    return dataSource.getLastArticles();
  }

  Future<List<Article>?> getPrerequisite({required String id}) async {
    return dataSource.getPrerequisite(id: id);
  }

  Future<Article?> getArticleById({required String id}) async {
    final Article? article = await dataSource.getArticleById(id: id);
    if (article == null) {
      return null;
    }
    return article;
  }
}
