// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tiktok/gen/assets.gen.dart';

class Heart {
  AnimationController controller;
  Offset position;
  Tween<double> scaleTween;
  Tween<double> opacityTween;

  Heart(
    this.controller,
    this.position,
    this.scaleTween,
    this.opacityTween,
  );
}

class DoubleTapLike extends StatefulWidget {
  const DoubleTapLike({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  _DoubleTapLikeState createState() => _DoubleTapLikeState();
}

class _DoubleTapLikeState extends State<DoubleTapLike>
    with TickerProviderStateMixin {
  List<Heart> _hearts = [];

  @override
  void dispose() {
    for (var heart in _hearts) {
      heart.controller.dispose();
    }
    super.dispose();
  }

  void _handleDoubleTap(TapDownDetails details) {
    final controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    final scaleTween = Tween<double>(begin: 0.5, end: 1.0);
    final opacityTween = Tween<double>(begin: 1.0, end: 0.0);

    final heart = Heart(
      controller,
      details.globalPosition,
      scaleTween,
      opacityTween,
    );
    _hearts.add(heart);

    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _hearts.remove(heart);
        controller.dispose();
      }
    });

    Future.delayed(Duration(milliseconds: 500), () {
      controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: _handleDoubleTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.child,
          for (var heart in _hearts)
            Positioned(
              left: heart.position.dx - 130,
              top: heart.position.dy - 120,
              child: AnimatedBuilder(
                  animation: heart.controller,
                  builder: (context, child) {
                    var transform =
                        Curves.easeOutBack.transform(heart.controller.value);
                    final offsetY = -100 * transform;
                    final scale = heart.scaleTween
                        .animate(CurvedAnimation(
                            parent: heart.controller,
                            curve: Interval(0.0, 1, curve: Curves.easeOutBack)))
                        .value;
                    final opacity = heart.opacityTween
                        .animate(CurvedAnimation(
                            parent: heart.controller,
                            curve: Interval(0.0, 1.0, curve: Curves.easeOut)))
                        .value;
                    return Transform.translate(
                      offset: Offset(0, offsetY),
                      child: Transform.scale(
                        scale: scale,
                        child: Opacity(
                          opacity: opacity,
                          child: Assets.icons.svg.heart.svg(
                            height: 250,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.red,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
        ],
      ),
    );
  }
}
