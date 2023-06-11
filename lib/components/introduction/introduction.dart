import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:dev_shot/components/breadcrumb_step/breadcrumb_step.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Prérequis",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: Theme.of(context).textTheme.titleMedium!.fontWeight,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          ),
        ),
        const SizedBox(
          height: spaceL,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreadcrumbStep(
              index: 1,
              title: 'Créer un projet Firebase',
            ),
            BreadcrumbStep(
              index: 2,
              title: "Copier le code d'initialisation",
            ),
            BreadcrumbStep(
              index: 3,
              title: "Initialiser le SDK Firebase",
            ),
            BreadcrumbStep(
              index: 4,
              title: "Initialiser le SDK Firebase",
            ),
            BreadcrumbStep(
              index: 5,
              title: "Initialiser le SDK Firebase",
            ),
            BreadcrumbStep(
              index: 6,
              last: true,
              title: "Initialiser le SDK Firebase",
            ),
          ],
        )
      ],
    );
  }
}
