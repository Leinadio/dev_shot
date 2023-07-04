// import 'package:dev_shot/infra/content/content_adapter.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dev_shot/presentation/screens/prerequisite.dart';
import 'package:dev_shot/presentation/components/question/question.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({
    super.key,
    required this.data,
  });

  final data;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final controller = ScrollController();

  getMarkdown(context, content) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final pathReference = storageRef.child(content);
      print('pathReference : $pathReference');
      final Uint8List? url = await pathReference.getData();
      return utf8.decode(url!);
    } catch (e) {
      print('e $e');
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                print('Go to favorite');
              },
              icon: Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.primary, // backgroundColor: Colors.white,
          title: logo,
          bottom: TabBar(
            unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
            indicatorColor: Theme.of(context).colorScheme.onPrimary,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            tabs: const [
              Tab(
                icon: Column(
                  children: [
                    Icon(Icons.article),
                    Text('Article'),
                  ],
                ),
              ),
              Tab(
                icon: Column(
                  children: [
                    Icon(Icons.menu),
                    Text('Avant de commencer'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: spaceM,
              ),
              child: FutureBuilder(
                  future: getMarkdown(context, widget.data.content),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.none) {
                      return Center(
                        child: Text(
                          'Error',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text(
                            'Error',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        );
                      }
                      return Markdown(
                        data: snapshot.data.toString(),
                        styleSheet: MarkdownStyleSheet(
                          h1: TextStyle(
                            fontSize: 32,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          h2: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          p: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          code: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                          listBullet: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(spaceM),
                child: const Prerequisite(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.question_answer),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SafeArea(
                  child: Container(
                    height: 500,
                    padding: const EdgeInsets.only(
                      top: spaceL,
                      left: spaceM,
                      right: spaceM,
                      bottom: spaceXL,
                    ),
                    width: double.infinity,
                    child: const Question(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
