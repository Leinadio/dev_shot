import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/domain/favorites/favorites_port.dart';

class FavoritesController {
  final IFavoritesPort dataSource;
  const FavoritesController({required this.dataSource});

  Future<List<Article>> getFavoritesByUserId({required String userId}) {
    // Retourner le model en future dans

    // vu qu'on ne sait pas qu'elle database il y a derrière on peut le changer ça ne changera pas le comportement
    return dataSource.getFavoritesByUserId(userId: userId);
  }
}
