import 'package:flutter/material.dart';
import 'package:tiktok/core/common_widgets/custom_container/responsive_center.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/breakpoints.dart';

/// Scrollable widget that shows a responsive card with a given child widget.
/// Useful for displaying forms and other widgets that need to be scrollable.
class ResponsiveScrollableCard extends StatelessWidget {
  const ResponsiveScrollableCard({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
