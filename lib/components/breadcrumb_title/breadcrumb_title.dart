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
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
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
        BreadcrumbNumber(
          number: index.toString(),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
          ),
        )
      ],
    );
  }
}
