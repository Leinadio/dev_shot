import 'package:dev_shot/domain/favorites/favorites_controller.dart';
import 'package:dev_shot/infra/articles/models/article.dart';
import 'package:dev_shot/infra/favorites/adapters/favorites_adapter.dart';

class FavoritesApplication {
  final favoritesController = FavoritesController(dataSource: FavoritesFirestoreAdapter());

  Future<List<Article?>> getFavoritesByUserId({userId}) {
    return favoritesController.getFavoritesByUserId(userId: userId);
  }
}
