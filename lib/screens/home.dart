import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/components/shot/shot.dart';
import 'package:dev_shot/screens/article.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spaceL),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: spaceXL,
                ),
                Text(
                  "Des articles concentrés qui font gagner du temps",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: spaceXL,
                ),
                Text(
                  "Une veille et des articles de développement qui vont droit au but. \n Prenez rapidement vos shots",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 58,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: spaceL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: spaceM,
                  ),
                  Text(
                    "Les derniers shots d'articles",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: spaceM,
                          ),
                          Shot(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const ArticleScreen();
                                }),
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
