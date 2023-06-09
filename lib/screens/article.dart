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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        // backgroundColor: Colors.white,
        title: logo,
      ),
      body: Container(
        padding: const EdgeInsets.all(spaceM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ArticleHeader(),
            const SizedBox(
              height: spaceM,
            ),
            const Divider(),
            const SizedBox(
              height: spaceM,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    onPressed: () {
                      _onTap('introduction');
                    },
                    child: Text(
                      '1 Introduction',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
                const SizedBox(
                  width: spaceM,
                ),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      _onTap('article');
                    },
                    child: Text(
                      '1 Articles',
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: spaceM,
            ),
            const Divider(),
            const SizedBox(
              height: spaceXL,
            ),
            if (_showIntroOrArticle == 0)
              const Introduction()
            else
              const Center(
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              )
          ],
        ),
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
    );
  }
}
