import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/constants.dart';

class CustomContainerTransform extends StatelessWidget {
  const CustomContainerTransform({
    super.key,
    required this.closedBuilder,
    this.openWidget,
    this.closedBorderRadius,
  });

  final Widget Function(BuildContext, void Function()) closedBuilder;
  final Widget? openWidget;
  final double? closedBorderRadius;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      closedElevation: $constants.theme.defaultElevation,
      openElevation: $constants.theme.defaultElevation,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(
            closedBorderRadius ?? $constants.theme.defaultBorderRadius)),
      ),
      // closedColor: context.theme.surface,
      // openColor: context.getTheme.surface,
      // middleColor: context.getTheme.surface,
      tappable: openWidget != null,
      openBuilder: (context, _) => openWidget ?? const SizedBox(),
      closedBuilder: closedBuilder,
    );
  }
}
