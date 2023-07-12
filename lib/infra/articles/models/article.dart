// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
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

  // Article copyWith({
  //   String? title,
  //   String? imagePath,
  // }) {
  //   return Article(
  //     title: title ?? this.title,
  //     imagePath: imagePath ?? this.imagePath,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'title': title,
  //     'imagePath': imagePath,
  //   };
  // }

  factory Article.fromMap(Map<String, dynamic> data) {
    return Article(
      id: data['id'] as String,
      title: data['title'] as String,
      imagePath: data['image_path'] as String,
      content: data['content'] as String,
      prerequisites: data['prerequisites'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Article.fromJson(String source) =>
  //     Article.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() => 'Article(title: $title, imagePath: $imagePath)';

  // @override
  // bool operator ==(covariant Article other) {
  //   if (identical(this, other)) return true;

  //   return other.title == title && other.imagePath == imagePath;
  // }

  // @override
  // int get hashCode => title.hashCode ^ imagePath.hashCode;

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
