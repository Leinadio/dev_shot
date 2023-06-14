import 'package:dev_shot/repositories/articles.dart';
import 'package:dev_shot/widgets/card/card_list/card_list.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:dev_shot/screens/article.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ArticleRepository articleRepository = ArticleRepository();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spaceM),
              child: Column(
                children: <Widget>[
                  Text(
                    "Des articles concentrés qui font gagner du temps",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: spaceM,
                  ),
                  Text(
                    "Une veille et des articles de développement qui vont droit au but. \nPrenez rapidement vos shots",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: spaceXXL,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spaceM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: spaceM,
                  ),
                  Text(
                    "Les derniers shots",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  FutureBuilder(
                    future: articleRepository.list(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CardList(
                          source: snapshot.data,
                          onItemTap: (index) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
