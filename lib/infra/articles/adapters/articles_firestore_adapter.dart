import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_shot/infra/articles/models/article.dart';
import 'package:dev_shot/infra/articles/ports/articles_port.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

class ArticleFirestoreAdapter extends IArticlesPort {
  final FirebaseFirestore _firestoreDb = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>>? collection;

  ArticleFirestoreAdapter() {
    collection = _firestoreDb.collection('articles');
  }

  @override
  Future<List<Article>> getLastArticles() async {
    final time = DateTime.now().toUtc().millisecondsSinceEpoch;

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection!
        .where('published_date', isLessThanOrEqualTo: time)
        .orderBy('published_date', descending: true)
        .limit(3)
        .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> articles = querySnapshot.docs;
    return articles.map((QueryDocumentSnapshot<Map<String, dynamic>> el) {
      final data = el.data();
      final m = Article.fromMap({
        "id": el.id,
        ...data,
      });
      return m;
    }).toList();
  }

  @override
  Future<Article?> getArticleById({required String id}) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot = await collection!.doc(id).get();
    final data = querySnapshot.data();
    if (data == null) {
      return null;
    }
    return Article.fromMap({
      ...data,
      "id": querySnapshot.id,
    });
  }

  @override
  Future<List<Article>> getArticleByTitle({required String title}) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection!
        .where('title_search', isGreaterThanOrEqualTo: title.toLowerCase())
        .where('title_search', isLessThan: '${title}z')
        .where('category', isEqualTo: 'firebase')
        .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> articles = querySnapshot.docs;
    return articles.map((QueryDocumentSnapshot<Map<String, dynamic>> el) {
      final data = el.data();
      final m = Article.fromMap({
        "id": el.id,
        ...data,
      });
      return m;
    }).toList();
  }
}
