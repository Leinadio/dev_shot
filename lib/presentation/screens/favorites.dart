import 'package:dev_shot/application/favorites.dart';
import 'package:dev_shot/presentation/screens/article.dart';
import 'package:dev_shot/presentation/widgets/card/card_list/card_list.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    FavoritesApplication favoritesApplication = FavoritesApplication();
    return FutureBuilder(
      future: favoritesApplication.getFavoritesByUserId(userId: 'hDsQs9nh41JraeCEuYf9'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CardList(
            source: snapshot.data,
            onItemTap: (index) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return ArticleScreen(
                    data: snapshot.data![index],
                  );
                }),
              );
            },
          );
        }
        if (snapshot.hasError) {
          return const Text('erreur');
        }
        return const Center(
          child: Column(
            children: [
              SizedBox(
                height: spaceL,
              ),
              CircularProgressIndicator(
                color: Colors.amber,
              ),
            ],
          ),
        );
      },
    );
  }
}
