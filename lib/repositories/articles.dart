import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_shot/services/data_service.dart';

class ArticleRepository {
  final DataService dataService;

  ArticleRepository() : dataService = DataService();

  Future<List<QueryDocumentSnapshot<Object?>>> list() {
    return dataService.list(collectionName: 'articles');
  }
}
