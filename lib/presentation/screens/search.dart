import 'package:dev_shot/application/articles/articles_app.dart';
import 'package:dev_shot/presentation/widgets/card/card_image/card_image.dart';
import 'package:dev_shot/presentation/widgets/card/card_tile/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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

          TextFormField(
            onChanged: (String value) {
              print('value : $value');
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
                      '#firebase',
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
            child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: spaceM,
                    ),
                    CardTile(
                      title: 'aaa',
                      leadingImage: const CardImage(
                        path: 'assets/images/firebase.png',
                      ),
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (BuildContext context) {
                        //     return const ArticleScreen(
                        //       data: [],
                        //     );
                        //   }),
                        // );
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
