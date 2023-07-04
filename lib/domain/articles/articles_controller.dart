import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/domain/articles/articles_port.dart';

class ArticlesController {
  final IArticlesPort dataSource;
  const ArticlesController({required this.dataSource});

  Future<List<Article>> getArticles() {
    // Retourner le model en future dans

    // vu qu'on ne sait pas qu'elle database il y a derrière on peut le changer ça ne changera pas le comportement
    return dataSource.getArticles();
  }
}
