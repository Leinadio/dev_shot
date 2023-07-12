import 'package:dev_shot/application/articles/ports/article_request_port.dart';
import 'package:dev_shot/application/articles/models/article.dart';
import 'package:dev_shot/infra/articles/ports/articles_port.dart';
import 'package:dev_shot/infra/article_content/ports/article_content_port.dart';
import 'package:dev_shot/infra/articles/models/article.dart';

class ArticlesController extends IArticleRequest {
  ArticlesController({required this.dataSource, required this.contentAdapter});
  final IArticlesPort dataSource;
  final IContentPort contentAdapter;

  @override
  Future<List<Article>> getLastArticles() async {
    try {
      // Retourner le model en future dans
      // vu qu'on ne sait pas qu'elle database il y a derrière on peut le changer ça ne changera pas le comportement
      return dataSource.getLastArticles();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<ArticleApp?> getArticleById({required String id}) async {
    final Article? article = await dataSource.getArticleById(id: id);
    if (article == null) {
      return null;
    }
    final String? content = await contentAdapter.getContent(article.content);
    if (content == null) {
      return null;
    }
    return ArticleApp(
      id: article.id,
      title: article.title,
      content: content,
      imagePath: article.imagePath,
      prerequisites: article.prerequisites,
    );
  }
}
