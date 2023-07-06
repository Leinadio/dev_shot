import 'package:dev_shot/presentation/widgets/breadcrumb/breadcrumb_list/breadcrumb_list.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:dev_shot/presentation/widgets/breadcrumb/breadcrumb_step/breadcrumb_step.dart';

class Prerequisite extends StatelessWidget {
  const Prerequisite({
    super.key,
    required this.data,
  });
  final data;

  List<BreadcrumbStep> displayBreadcrumbStep() {
    final List<BreadcrumbStep> result = [];

    for (var i = 0; i < data.length; i++) {
      result.add(
        BreadcrumbStep(
          index: data[i]['etape_num'],
          id: data[i]['articleId'],
          title: data[i]['title'],
          last: data.length - 1 == i,
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: spaceL,
        ),
        BreadcrumbList(children: displayBreadcrumbStep())
      ],
    );
  }
}
