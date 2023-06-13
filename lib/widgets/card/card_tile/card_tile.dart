import 'package:dev_shot/widgets/info_tag/info_tag_item.dart';
import 'package:dev_shot/styles/styles.dart';
import 'package:dev_shot/components/title_font/title_font.dart';
import 'package:dev_shot/widgets/info_tag/list_infotag.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.onTap,
    this.leadingImage,
    required this.title,
  });

  final void Function() onTap;
  final Widget? leadingImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    void _onTap() {
      onTap();
    }

    Widget _displayLeadingImage() {
      if (leadingImage != null) {
        return leadingImage!;
      }
      return Container();
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
              _displayLeadingImage(),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleFont(
                    value: title,
                    fontSize: FontSize.large,
                    fontWeight: FontWeightSize.bold,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  const SizedBox(
                    height: spaceM,
                  ),
                  const ListInfoTag(
                    children: [
                      InfoTag(
                        text: '3 questions',
                        icon: Icons.question_mark,
                      ),
                      InfoTag(
                        text: 'Niveau 1',
                        icon: Icons.keyboard_double_arrow_up,
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
