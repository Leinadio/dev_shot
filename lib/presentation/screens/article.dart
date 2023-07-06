// import 'package:dev_shot/infra/content/content_adapter.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dev_shot/application/articles.dart';
import 'package:dev_shot/domain/models/article.dart';
import 'package:dev_shot/presentation/screens/prerequisite.dart';
import 'package:dev_shot/presentation/components/question/question.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final controller = ScrollController();
  ArticleApplication postApplication = ArticleApplication();

  getMarkdown(context, content) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final pathReference = storageRef.child(content);
      final Uint8List? url = await pathReference.getData();
      return utf8.decode(url!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Widget displayPrerequisites(prerequisites) {
    if (prerequisites.length == 0) {
      return Center(
        child: Text(
          'No Data',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(spaceM),
        child: Prerequisite(
          data: prerequisites,
        ),
      ),
    );
  }

  Widget displayContent(Article? data) {
    if (data == null) {
      return Center(
        child: Text(
          'No Data',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }
    return TabBarView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: spaceM,
          ),
          child: Markdown(
            data: data.content,
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
          ),
        ),
        displayPrerequisites(data.prerequisites),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
        body: FutureBuilder(
          future: postApplication.getArticleById(id: widget.id),
          builder: (BuildContext context, AsyncSnapshot<Article?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
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
              if (!snapshot.hasData && snapshot.data != null) {
                return Center(
                  child: Text(
                    'Error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                );
              }
              return displayContent(snapshot.data);
            }
            return CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondaryContainer,
            );
          },
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
