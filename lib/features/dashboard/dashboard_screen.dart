import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/features/video_play/video_play.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Stack(
        children: [
          TabBarView(
            children: [
              PageView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return VideoPlayerScreen();
                },
              ),
              PageView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return VideoPlayerScreen();
                },
              ),
              PageView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return VideoPlayerScreen();
                },
              ),
            ],
          ),
          SafeArea(
            child: TabBar(
              indicatorColor: Colors.black,
              unselectedLabelColor: $constants.appColor.kUnSelectTabBar,
              labelColor: Colors.black,
              tabs: [
                Text('Bạn bè'),
                Text('Đang follow'),
                Text('Dành cho bạn'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
