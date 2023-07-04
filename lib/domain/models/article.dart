// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class Article {
  Article({
    required this.title,
    required this.imagePath,
    required this.content,
  });

  final String title;
  final String imagePath;
  final String content;

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

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] as String,
      imagePath: map['image_path'] as String,
      content: map['content'] as String,
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
}
