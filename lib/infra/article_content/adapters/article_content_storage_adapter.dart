import 'dart:convert';
import 'dart:typed_data';
import 'package:dev_shot/infra/article_content/ports/article_content_port.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ArticleContentStorageAdapter extends IContentPort {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String?> getContent(String content) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final pathReference = storageRef.child(content);
      final Uint8List? url = await pathReference.getData();
      return utf8.decode(url!);
    } catch (e) {
      return null;
    }
  }
}
