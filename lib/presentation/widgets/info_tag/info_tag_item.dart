import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';

class InfoTag extends StatelessWidget {
  const InfoTag({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        const SizedBox(
          width: spaceXXS,
        ),
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
          ),
        ),
      ],
    );
  }
}
