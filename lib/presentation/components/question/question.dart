import 'package:flutter/material.dart';
import 'package:dev_shot/styles/styles.dart';

class Submit extends StatelessWidget {
  const Submit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/submit.jpg'),
        const SizedBox(
          height: spaceM,
        ),
        Text(
          'Ta question a bien été envoyé',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(
          height: spaceM,
        ),
        Text(
          'Tu recevras une notification par mail lorsque ta question sera traitée',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Envoyer',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool isSend = false;

  Widget _showQuestionOrSubmit() {
    if (isSend) {
      return Submit();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ajouter une question',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(
          height: spaceS,
        ),
        Text(
          'à propos de Initialiser Firebase',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(
          height: spaceL,
        ),
        Text(
          'Ta question',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(
          height: spaceM,
        ),
        TextFormField(),
        const SizedBox(
          height: spaceL,
        ),
        Text(
          'Ton email',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(
          height: spaceM,
        ),
        TextFormField(),
        const SizedBox(
          height: spaceM,
        ),
        Text(
          'Tu recevras une notification par mail lorsque ta question sera traitée',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
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
                  setState(() {
                    isSend = true;
                  });
                },
                child: Text(
                  'Envoyer',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
                  Navigator.pop(context);
                },
                child: Text(
                  'Annuler',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showQuestionOrSubmit();
  }
}
