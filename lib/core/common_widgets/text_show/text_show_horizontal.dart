import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/app_sizes.dart';

class TextShowHorizontal extends StatelessWidget {
  const TextShowHorizontal({
    super.key,
    required this.content,
    this.textStyle,
    required this.icon,
  });
  final String content;
  final TextStyle? textStyle;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        gapW8,
        Text(content, style: textStyle),
      ],
    );
  }
}
