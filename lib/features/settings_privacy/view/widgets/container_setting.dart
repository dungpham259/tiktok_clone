import 'package:flutter/material.dart';
import 'package:tiktok/core/common_widgets/text_show/text_show_horizontal.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';

class ContainerSettings extends StatelessWidget {
  const ContainerSettings({
    super.key,
    this.title,
    required this.widget,
  });
  final String? title;
  final List<Widget> widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(
              left: Sizes.p8,
              bottom: Sizes.p8,
            ),
            child: Text(
              title ?? '',
              style: context.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: $constants.appColor.kTextColor2,
                fontSize: 13,
              ),
            ),
          ),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p16),
            color: $constants.appColor.kWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.p20, vertical: Sizes.p24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget,
            ),
          ),
        )
      ],
    );
  }
}

class OptionSettings extends StatelessWidget {
  const OptionSettings({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });
  final Function()? onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextShowHorizontal(
      content: title,
      icon: Icon(
        icon,
        color: $constants.appColor.kGreyMain,
      ),
      suffixIcon: Icon(
        Icons.arrow_forward_ios,
        color: $constants.appColor.kGreyMain,
        size: 12,
      ),
      onTap: () {},
    );
  }
}
