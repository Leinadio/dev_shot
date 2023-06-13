import 'package:dev_shot/widgets/breadcrumb/breadcrumb_list/breadcrumb_list.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:dev_shot/widgets/breadcrumb/breadcrumb_step/breadcrumb_step.dart';

class Prerequisite extends StatelessWidget {
  const Prerequisite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: spaceL,
        ),
        BreadcrumbList(
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
              title: "Mettre en place React",
              last: true,
            ),
          ],
        )
      ],
    );
  }
}
