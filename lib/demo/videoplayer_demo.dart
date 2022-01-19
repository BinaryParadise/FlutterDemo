import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerDemo extends StatefulWidget {
  const VideoPlayerDemo({Key? key}) : super(key: key);

  @override
  State<VideoPlayerDemo> createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4
    _controller = VideoPlayerController.network(
        'http://www.w3school.com.cn/example/html5/mov_bbb.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget current;
    current = FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          Widget widget;
          if (snapshot.connectionState == ConnectionState.done) {
            widget = AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
            widget = Container(
              color: Colors.grey,
              child: widget,
            );
          } else {
            widget = CircularProgressIndicator();
          }
          widget = Center(
            child: widget,
          );
          return widget;
        });
    current = Scaffold(
      appBar: AppBar(
        title: Text('VideoPlayer'),
      ),
      body: current,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
    return current;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
