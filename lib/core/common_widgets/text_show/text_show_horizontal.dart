import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';

class TextShowHorizontal extends StatelessWidget {
  const TextShowHorizontal({
    super.key,
    required this.label,
    this.textStyleLabel,
    required this.icon,
    this.onTap,
    this.suffixIcon,
    this.subLabel,
    this.textStyleSubLabel,
  });
  final String label;
  final String? subLabel;
  final TextStyle? textStyleLabel;
  final TextStyle? textStyleSubLabel;
  final Widget? icon;
  final Widget? suffixIcon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon ?? SizedBox.shrink(),
                    gapW8,
                  ],
                  Text(label, style: textStyleLabel),
                ],
              ),
              if (suffixIcon != null) ...[
                Spacer(),
                suffixIcon!,
              ]
            ],
          ),
          if (subLabel != null) ...[
            gapH8,
            Text(
              subLabel!,
              style: textStyleSubLabel ??
                  context.textTheme.labelSmall!.copyWith(
                    color: $constants.appColor.kTextColor2,
                  ),
            ),
          ]
        ],
      ),
    );
  }
}
