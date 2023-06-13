import 'package:dev_shot/widgets/card/card_image/card_image.dart';
import 'package:dev_shot/widgets/card/card_tile/card_tile.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({super.key, required this.onItemTap});

  final void Function(int index) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, index) {
        return Column(
          children: [
            const SizedBox(
              height: spaceM,
            ),
            CardTile(
              title: 'Initialiser Firebase',
              leadingImage: const CardImage(
                path: 'assets/images/firebase.png',
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
