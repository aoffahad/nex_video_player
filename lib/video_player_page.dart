import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late FlickManager flickManager;
  @override
  void initState() {
    /// From Network
    // flickManager = FlickManager(
    //     videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
    //         "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")));

    /// From Asset
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.asset("assets/video/video1.mp4"));
    super.initState();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Video Player",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: FlickVideoPlayer(
            wakelockEnabled: true,
            wakelockEnabledFullscreen: true,
            flickManager: flickManager,
          ),
        ),
      ),
    );
  }
}
