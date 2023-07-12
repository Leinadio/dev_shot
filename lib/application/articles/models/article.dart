// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'package:equatable/equatable.dart';

class ArticleApp extends Equatable {
  const ArticleApp({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.content,
    required this.prerequisites,
  });

  final String id;

  final String title;
  final String imagePath;
  final String content;
  final List<dynamic> prerequisites;

  @override
  List<Object> get props {
    return [
      id,
      title,
      imagePath,
      content,
      prerequisites,
    ];
  }
}
