import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';

class MaterialSplashTappable extends StatelessWidget {
  const MaterialSplashTappable(
      {super.key, this.radius, this.onTap, required this.child});

  final double? radius;
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? $constants.theme.defaultBorderRadius,
          ),
        ),
        overlayColor: MaterialStateProperty.all(
          context.getCustomOnPrimaryColor.withOpacity(0.1),
        ),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
