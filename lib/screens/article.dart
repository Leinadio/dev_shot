import 'package:dev_shot/components/article_header.dart/article_header.dart';
import 'package:dev_shot/components/introduction/introduction.dart';
import 'package:dev_shot/components/question/question.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dev_shot/services/logo.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  int _showIntroOrArticle = 0;

  void _onTap(value) {
    if (value == 'introduction') {
      setState(() {
        _showIntroOrArticle = 0;
      });
      return;
    }
    setState(() {
      _showIntroOrArticle = 1;
    });
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
          backgroundColor: Theme.of(context)
              .colorScheme
              .primary, // backgroundColor: Colors.white,
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
                    Text('Prérequis'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: spaceM,
                  ),
                  Text(
                    'Initialiser Firebase',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'introduction pour initialiser firebase',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(spaceM),
                child: const Introduction(),
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
                      child: const Question()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
