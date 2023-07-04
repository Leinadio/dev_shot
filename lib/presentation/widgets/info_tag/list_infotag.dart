import 'package:dev_shot/presentation/widgets/info_tag/info_tag_item.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';

enum Direction {
  horizontal,
  vertical,
}

class ListInfoTag extends StatelessWidget {
  const ListInfoTag({super.key, required this.children});

  final List<InfoTag> children;

  List<Widget> _displayChildren() {
    List<Widget> list = [];
    for (var i = 0; i < children.length; i++) {
      if (children.length - 1 == i) {
        list.add(children[i]);
      } else {
        list.add(children[i]);
        list.add(const SizedBox(width: spaceM));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _displayChildren(),
    );
  }
}
