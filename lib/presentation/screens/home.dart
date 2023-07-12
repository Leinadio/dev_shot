import 'package:dev_shot/application/articles/models/article.dart';
import 'package:dev_shot/application/articles/articles_app.dart';
import 'package:dev_shot/infra/articles/models/article.dart';
import 'package:dev_shot/presentation/widgets/card/card_list/card_list.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:dev_shot/presentation/screens/article.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ArticlesApplication articleApplication = ArticlesApplication();

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
                      fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
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
                      fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
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
                      fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  FutureBuilder<List<Article>>(
                    future: articleApplication.getLastArticles(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CardList(
                          source: snapshot.data,
                          onItemTap: (index) {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                                final id = snapshot.data![index].id;
                                return ArticleScreen(
                                  id: id,
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
