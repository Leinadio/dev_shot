import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/domain/articles/articles_port.dart';
import 'package:dev_shot/infra/storage/content_adapter.dart';

class ArticleFirestoreAdapter extends IArticlesPort {
  final FirebaseFirestore _firestoreDb = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>>? collection;
  final ContentStorageAdapter contentStorageAdapter = ContentStorageAdapter();

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
      final m = Article.fromMap({"id": el.id, ...data});
      return m;
    }).toList();
  }

  @override
  Future<List<Article>?> getPrerequisite({required String id}) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot = await collection!.doc(id).get();
    final data = querySnapshot.data();

    if (data == null) {
      return null;
    }

    QuerySnapshot<Map<String, dynamic>> querySnapshota =
        await collection!.where(FieldPath.documentId, whereIn: data['prerequisites']).get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> articles = querySnapshota.docs;

    return articles.map((QueryDocumentSnapshot<Map<String, dynamic>> el) {
      final data = el.data();

      final Article m = Article.fromMap({
        ...data,
        "id": el.id,
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
    final String? content = await contentStorageAdapter.getContent(data['content']);
    return Article.fromMap({
      ...data,
      "id": querySnapshot.id,
      "content": content,
    });
  }
}
