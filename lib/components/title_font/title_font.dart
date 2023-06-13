import 'package:flutter/material.dart';

enum FontSize {
  small,
  mediumn,
  large,
}

enum FontWeightSize {
  small,
  mediumn,
  large,
  bold,
}

enum Scheme {
  primary,
  onPrimary,
  primaryContainer,
  onPrimaryContainer,
}

class TitleFont extends StatelessWidget {
  const TitleFont({
    super.key,
    required this.value,
    required this.fontSize,
    this.fontWeight = FontWeightSize.mediumn,
    this.color = Colors.white,
    this.textAlign = TextAlign.left,
  });

  final String value;
  final FontSize fontSize;
  final FontWeightSize fontWeight;
  final Color color;
  final TextAlign textAlign;

  double? _getFontSize(context) {
    if (fontSize == FontSize.small) {
      return Theme.of(context).textTheme.titleSmall!.fontSize;
    }
    if (fontSize == FontSize.mediumn) {
      return Theme.of(context).textTheme.titleMedium!.fontSize;
    }
    return Theme.of(context).textTheme.titleLarge!.fontSize;
  }

  FontWeight? _getFontWeight(context) {
    if (fontWeight == FontWeightSize.small) {
      return Theme.of(context).textTheme.titleSmall!.fontWeight;
    }
    if (fontWeight == FontWeightSize.mediumn) {
      return Theme.of(context).textTheme.titleMedium!.fontWeight;
    }
    if (fontWeight == FontWeightSize.large) {
      return Theme.of(context).textTheme.titleMedium!.fontWeight;
    }
    return FontWeight.bold;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      maxLines: 1,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: _getFontSize(context),
        fontWeight: _getFontWeight(context),
        color: color,
      ),
    );
  }
}
