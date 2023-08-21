import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok/core/common_widgets/custom_container/avatar.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/gen/assets.gen.dart';

class DiscWheel extends StatefulWidget {
  const DiscWheel({
    super.key,
    required this.isAnimating,
  });
  final bool isAnimating;

  @override
  _DiscWheelState createState() => _DiscWheelState();
}

class _DiscWheelState extends State<DiscWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void didUpdateWidget(DiscWheel oldWidget) {
    if (widget.isAnimating != oldWidget.isAnimating) {
      if (widget.isAnimating) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _controller.value * 2 * pi, // Radians for a full circle
      child: SizedBox(
        height: Sizes.p46,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Assets.icons.svg.disc.svg(),
            Avatar(
              radius: Sizes.p12,
              photoUrl:
                  'https://www.facetofacemedical.com.au/wp-content/uploads/2021/12/Male-rejuvenation-01.jpg',
            ),
          ],
        ), // Replace with your image asset
      ),
    );
  }
}
