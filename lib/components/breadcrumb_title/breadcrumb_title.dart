import 'package:dev_shot/components/shot/shot.dart';
import 'package:dev_shot/screens/article.dart';
import 'package:flutter/material.dart';

class BreadcrumbNumber extends StatelessWidget {
  const BreadcrumbNumber({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
          fontWeight: Theme.of(context).textTheme.titleLarge!.fontWeight,
        ),
      ),
    );
  }
}

class BreadcrumbTitle extends StatelessWidget {
  const BreadcrumbTitle({super.key, required this.index, required this.title});

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // BreadcrumbNumber(
        //   number: index.toString(),
        // ),
        // const SizedBox(
        //   width: 8,
        // ),
        Expanded(
          child: Shot(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const ArticleScreen();
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
