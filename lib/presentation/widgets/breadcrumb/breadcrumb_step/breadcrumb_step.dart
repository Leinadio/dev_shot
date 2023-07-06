import 'package:dev_shot/presentation/components/title_font/title_font.dart';
import 'package:dev_shot/presentation/screens/article.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:dev_shot/presentation/widgets/card/card_tile/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class BreadcrumbStep extends StatelessWidget {
  const BreadcrumbStep({
    super.key,
    required this.index,
    required this.id,
    required this.title,
    this.last = false,
  });

  final int index;
  final String id;
  final String title;
  final bool last;

  Widget _isLast(BuildContext context) {
    if (last) {
      return Container();
    }
    return Dash(
      direction: Axis.vertical,
      length: spaceXXL,
      dashLength: 12,
      dashColor: Theme.of(context).colorScheme.onPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: spaceM),
          // height: 50,
          width: double.infinity,
          child: TitleFont(
            value: 'Étape $index',
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: FontSize.mediumn,
            fontWeight: FontWeightSize.mediumn,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: spaceS,
        ),
        CardTile(
          title: title,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return ArticleScreen(id: id);
              }),
            );
          },
        ),
        const SizedBox(
          height: spaceS,
        ),
        _isLast(context),
        const SizedBox(
          height: spaceS,
        ),
      ],
    );
  }
}
