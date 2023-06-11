import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/components/breadcrumb_title/breadcrumb_title.dart';
import 'package:flutter_dash/flutter_dash.dart';

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
    return Dash(
      direction: Axis.vertical,
      length: spaceXXL,
      dashLength: 12,
      dashColor: Theme.of(context).colorScheme.onPrimary,
    );
    // return Container(
    //   margin: const EdgeInsets.only(left: 8),
    //   height: spaceXXL,
    //   width: 2,
    //   color: Theme.of(context).colorScheme.onPrimary,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: spaceM),
          // height: 50,
          width: double.infinity,
          child: Text(
            'Étape $index',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
            ),
          ),
        ),
        const SizedBox(
          height: spaceS,
        ),
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
