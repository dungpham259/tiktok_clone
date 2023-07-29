import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/app_sizes.dart';

class TextShowHorizontal extends StatelessWidget {
  const TextShowHorizontal({
    super.key,
    required this.content,
    this.textStyle,
    required this.icon,
    this.onTap,
    this.suffixIcon,
  });
  final String content;
  final TextStyle? textStyle;
  final Widget icon;
  final Widget? suffixIcon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          gapW8,
          Text(content, style: textStyle),
          if (suffixIcon != null) ...[
            Spacer(),
            suffixIcon!,
          ]
        ],
      ),
    );
  }
}
