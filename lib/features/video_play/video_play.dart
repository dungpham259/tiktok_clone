import 'package:flutter/material.dart';
import 'package:tiktok/features/video_play/widgets/controls_handle.dart';
import 'package:tiktok/features/video_play/widgets/controls_overlay.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      // closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            VideoPlayer(_controller),
            ClosedCaption(text: _controller.value.caption.text),
            ControlsOverlay(controller: _controller),
            ControlsHandle(
              avatarUrl: '',
            ),
            VideoProgressIndicator(_controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Colors.grey,
                  backgroundColor: Colors.white,
                )),
          ],
        ));
  }
}
