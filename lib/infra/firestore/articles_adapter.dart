import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/domain/articles/articles_port.dart';

class ArticleFirestoreAdapter extends IArticlesPort {
  final FirebaseFirestore _firestoreDb = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>>? collection;

  ArticleFirestoreAdapter() {
    collection = _firestoreDb.collection('articles');
  }

  @override
  Future<List<Article>> getArticles() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection!.get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> articles = querySnapshot.docs;
    return articles.map((QueryDocumentSnapshot<Map<String, dynamic>> el) {
      final data = el.data();
      return Article.fromMap(data);
    }).toList();
  }

  Future<Article> getArticlesById({required String articleId}) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot = await collection!.doc(articleId).get();
    final data = querySnapshot.data();
    return Article.fromMap(data!);
  }
}
