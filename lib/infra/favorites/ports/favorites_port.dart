import 'package:dev_shot/infra/articles/models/article.dart';

abstract class IFavoritesPort {
  Future<List<Article?>> getFavoritesByUserId({
    required String userId,
  });
}
