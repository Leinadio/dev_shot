import 'package:dev_shot/presentation/widgets/card/card_image/card_image.dart';
import 'package:dev_shot/presentation/widgets/card/card_tile/card_tile.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({
    super.key,
    required this.source,
    required this.onItemTap,
  });

  final source;
  final void Function(int index) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: source.length,
      itemBuilder: (BuildContext context, index) {
        print('source : $source');
        final data = source[index];
        print(data.title);

        return Column(
          children: [
            const SizedBox(
              height: spaceM,
            ),
            CardTile(
              title: data.title,
              leadingImage: CardImage(
                path: data.imagePath,
              ),
              onTap: () {
                onItemTap(index);
              },
            )
          ],
        );
      },
    );
  }
}
