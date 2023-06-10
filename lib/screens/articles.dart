import 'package:dev_shot/components/shot/shot.dart';
import 'package:dev_shot/screens/article.dart';
import 'package:dev_shot/screens/profil.dart';
import 'package:dev_shot/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spaceL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // const SizedBox(
            //   height: spaceXL,
            // ),
            // Text(
            //   "Tous les articles",
            //   style: TextStyle(
            //     color: Theme.of(context).colorScheme.primary,
            //     fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(
            //   height: spaceXL,
            // ),
            // Text(
            //   "Cherchez des shots de développement selon les thèmes qui vous intéressent",
            //   style: TextStyle(
            //     color: Theme.of(context).colorScheme.onPrimaryContainer,
            //     fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            //   ),
            // ),
            // const SizedBox(
            //   height: spaceM,
            // ),

            TextField(
              controller: TextEditingController(text: 'Rechercher...'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Search();
                    },
                  ),
                );
              },
              canRequestFocus: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: spaceM,
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 10,
                runSpacing: 10,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                      child: Text('#firebase'),
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                      child: Text('#firebase'),
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                      child: Text('#firebase'),
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                      child: Text('#firebase'),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: spaceM,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
                          MaterialPageRoute(builder: (BuildContext context) {
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
    );
  }
}
