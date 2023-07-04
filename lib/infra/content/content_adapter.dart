import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dart_code_viewer2/dart_code_viewer2.dart';

class ContentAdapter {
  List<Widget> createContent({required String data, required BuildContext context}) {
    final a = jsonDecode(data) as List<dynamic>;

    final b = a.map((el) {
      if (el["type"] == "title") {
        return Text(
          el["text"],
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            fontWeight: FontWeight.bold,
          ),
        );
      }
      if (el["type"] == "text") {
        return Text(
          el["text"],
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
          ),
        );
      }
      if (el["type"] == "image") {
        return Image.network(el["imageUrl"]);
      }
      if (el["type"] == "space") {
        return const SizedBox(
          height: 8,
        );
      }
      if (el["type"] == "code") {
        return DartCodeViewer(
          el["text"],
          height: 200,
          showCopyButton: false,
          numberStyle: const TextStyle(color: Colors.black),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          classStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          baseStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          constantStyle: TextStyle(color: Theme.of(context).colorScheme.error),
          keywordStyle: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer),
        );
      }
      return Container();
    }).toList();
    print('b $b');
    return b;
  }
}
