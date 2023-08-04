import 'package:flutter/material.dart';
import 'package:tiktok/features/video_play/video_play.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        VideoPlayerScreen(),
        VideoPlayerScreen(),
        VideoPlayerScreen(),
        VideoPlayerScreen(),
        VideoPlayerScreen(),
      ],
    );
  }
}
