import 'package:dev_shot/widgets/breadcrumb/breadcrumb_step/breadcrumb_step.dart';
import 'package:flutter/material.dart';

class BreadcrumbList extends StatelessWidget {
  const BreadcrumbList({super.key, required this.children});

  final List<BreadcrumbStep> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
