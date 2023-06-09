import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/components/breadcrumb_title/breadcrumb_title.dart';

class BreadcrumbStep extends StatelessWidget {
  const BreadcrumbStep({
    super.key,
    required this.index,
    required this.title,
    this.last = false,
  });

  final int index;
  final String title;
  final bool last;

  Widget _isLast(BuildContext context) {
    if (last) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(left: 8),
      height: spaceL,
      width: 2,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BreadcrumbTitle(index: index, title: title),
        const SizedBox(
          height: spaceS,
        ),
        _isLast(context),
        const SizedBox(
          height: spaceS,
        ),
      ],
    );
  }
}
