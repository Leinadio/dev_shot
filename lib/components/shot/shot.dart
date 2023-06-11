import 'package:dev_shot/styles/styles.dart';
import 'package:flutter/material.dart';

class Shot extends StatelessWidget {
  const Shot({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    void _onTap() {
      onTap();
    }

    return InkWell(
      onTap: _onTap,
      child: Card(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/images/firebase.png',
                width: 50,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Initialiser Firebase',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  Text(
                    'Une des questions vites répondues',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: spaceM,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.question_mark,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(
                            width: spaceXXS,
                          ),
                          Text(
                            '3 questions',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: spaceM,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_double_arrow_up,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(
                            width: spaceXXS,
                          ),
                          Text(
                            'Niveau 1',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
