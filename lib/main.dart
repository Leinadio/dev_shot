import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:dev_shot/main_scaffold.dart';
import 'package:dev_shot/services/theme/theme_light.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Main());
}

final db = FirebaseFirestore.instance;

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    // final article = <String, dynamic>{
    //   "title": "Initialiser Firebase",
    //   "image_path": "assets/images/firebase.png",
    // };

    // db.collection("articles").get().then((event) {
    //   for (var doc in event.docs) {
    //     print("${doc.id} => ${doc.data()}");
    //   }
    // });

    // db.collection("articles").add(article).then((DocumentReference doc) =>
    //     print('DocumentSnapshot added with ID: ${doc.id}'));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: const MainScaffold(),
    );
  }
}

// TODO: Ajouter les donnée avec firestore
// TODO: Shot et article
// TODO: Enlever le favoris