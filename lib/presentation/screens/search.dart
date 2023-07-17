import 'package:dev_shot/application/articles/articles_app.dart';
import 'package:dev_shot/infra/articles/models/article.dart';
import 'package:dev_shot/presentation/screens/article.dart';
import 'package:dev_shot/presentation/screens/filter.dart';
import 'package:dev_shot/presentation/widgets/card/card_image/card_image.dart';
import 'package:dev_shot/presentation/widgets/card/card_tile/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:badges/badges.dart' as badges;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Article> articles = [];
  ArticlesApplication articleApplication = ArticlesApplication();

  @override
  void initState() {
    super.initState();
    articleApplication.getLastArticles().then((value) => articles = value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spaceL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            onChanged: (String value) async {
              final newArticles = await articleApplication.getArticleByTitle(title: value);
              print('newArticles 11 : $newArticles');
              setState(() {
                articles = newArticles;
              });
            },
            // onTap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (BuildContext context) {
            //         return const Search();
            //       },
            //     ),
            //   );
            // },
            // canRequestFocus: false,

            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),

            decoration: InputDecoration(
              hintText: 'Rechercher...',
              suffixIconConstraints: const BoxConstraints.tightFor(),
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 12),
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 0),
                  showBadge: true,
                  badgeContent: Text(
                    '1',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (builder) {
                          return const FilterScreen();
                        },
                      );
                    },
                  ),
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              border: const OutlineInputBorder(
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
              alignment: WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '#react',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '#firebase',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '#googlecloud',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '#vuejs',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: spaceM,
          ),
          Expanded(
            child: FutureBuilder<List<Article>>(
              future: articleApplication.getLastArticles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: spaceM,
                          ),
                          CardTile(
                            title: articles.isNotEmpty
                                ? articles[index].title
                                : snapshot.data![index].title,
                            leadingImage: CardImage(
                              path: articles.isNotEmpty
                                  ? articles[index].imagePath
                                  : snapshot.data![index].imagePath,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return ArticleScreen(
                                    id: articles.isNotEmpty
                                        ? articles[index].id
                                        : snapshot.data![index].id,
                                  );
                                }),
                              );
                            },
                          )
                        ],
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
