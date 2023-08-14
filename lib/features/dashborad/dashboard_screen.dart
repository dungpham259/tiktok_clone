import 'package:flutter/material.dart';
import 'package:tiktok/features/video_play/video_play.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return VideoPlayerScreen();
      },
    );
  }
}
