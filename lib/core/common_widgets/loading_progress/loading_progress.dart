import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktok/gen/assets.gen.dart';

class LoadingProgress extends StatefulWidget {
  const LoadingProgress({super.key});

  @override
  State<LoadingProgress> createState() => _LoadingProgressState();
}

class _LoadingProgressState extends State<LoadingProgress>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      Assets.animations.progressLoading,
      fit: BoxFit.cover,
      height: 45,
      controller: _animationController,
    );
  }
}
