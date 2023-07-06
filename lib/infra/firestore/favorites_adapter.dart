import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_shot/domain/favorites/favorites_port.dart';
import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/infra/firestore/articles_adapter.dart';

class FavoritesFirestoreAdapter extends IFavoritesPort {
  final FirebaseFirestore _firestoreDb = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>>? collection;
  ArticleFirestoreAdapter articleFirestoreAdapter = ArticleFirestoreAdapter();

  FavoritesFirestoreAdapter() {
    collection = _firestoreDb.collection('favorites');
  }

  @override
  Future<List<Article?>> getFavoritesByUserId({
    required String userId,
  }) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collection!.where('userId', isEqualTo: userId).get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> favorites = querySnapshot.docs;

    final List<Article?> a =
        await Future.wait(favorites.map((QueryDocumentSnapshot<Map<String, dynamic>> el) async {
      final data = el.data();
      Article? article = await articleFirestoreAdapter.getArticleById(
        id: data['articleId'],
      );
      if (article == null) {
        return null;
      }
      return Article(
        id: article.id,
        title: article.title,
        content: article.content,
        imagePath: article.imagePath,
        prerequisites: article.prerequisites,
      );
    }));
    return a.where((element) => element != null).toList();
  }
}
