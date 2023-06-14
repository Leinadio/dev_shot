import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SourceData {
  final _firestoreDb = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> getFrom(collection) {
    if (collection == 'articles') {
      return _firestoreDb.collection("articles");
    }
    return _firestoreDb.collection("articles");
  }

  list({required String collectionName}) {}
}

class DataService extends SourceData {
  @override
  Future<List<QueryDocumentSnapshot<Object?>>> list(
      {required String collectionName}) async {
    final collection = getFrom(collectionName);
    QuerySnapshot querySnapshot = await collection.get();
    return querySnapshot.docs;
  }
}
