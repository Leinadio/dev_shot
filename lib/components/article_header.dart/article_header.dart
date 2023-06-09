import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';

class ArticleHeader extends StatelessWidget {
  const ArticleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Initialiser Firebase',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            fontWeight: Theme.of(context).textTheme.titleLarge!.fontWeight,
          ),
        ),
        const SizedBox(
          height: spaceS,
        ),
        Text(
          'Niveau: intermediaire',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          ),
        ),
        const SizedBox(height: spaceL),
        Row(
          children: [
            Row(
              children: [
                const Icon(Icons.schedule),
                const SizedBox(
                  width: spaceXS,
                ),
                Text(
                  '5 min',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Row(
                  children: [
                    Text(
                      '#firebase',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodySmall!.fontSize,
                      ),
                    ),
                    const SizedBox(
                      width: spaceXS,
                    ),
                    Text(
                      '#flutter',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodySmall!.fontSize,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: spaceM,
        ),
        Text(
          'publié le vendredi 9 juin 2023',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
          ),
        ),
      ],
    );
  }
}
