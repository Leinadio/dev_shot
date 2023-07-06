import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class ContentStorageAdapter {
  final storageRef = FirebaseStorage.instance.ref();

  Future<String?> getContent(content) async {
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
