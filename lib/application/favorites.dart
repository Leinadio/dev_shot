import 'package:dev_shot/domain/favorites/favorites_controller.dart';
import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/infra/firestore/favorites_adapter.dart';

class FavoritesApplication {
  final favoritesController = FavoritesController(dataSource: FavoritesFirestoreAdapter());

  Future<List<Article>> getFavoritesByUserId({userId}) {
    return favoritesController.getFavoritesByUserId(userId: userId);
  }
}
