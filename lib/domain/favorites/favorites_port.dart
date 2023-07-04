import 'package:dev_shot/domain/models/article.dart';

abstract class IFavoritesPort {
  Future<List<Article>> getFavoritesByUserId({
    required String userId,
  });
}
