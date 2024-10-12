import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Player',
      home: YouTubePlayerScreen(),
    );
  }
}

class YouTubePlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Player'),
      ),
      body: Expanded(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YoutubeFrame())
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network('https://img.youtube.com/vi/r_wwmmo6UGY/0.jpg'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YoutubeFrame())
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network('https://img.youtube.com/vi/fhzkeFiXfPI/0.jpg'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YoutubeFrame())
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network('https://img.youtube.com/vi/r_wwmmo6UGY/0.jpg'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YoutubeFrame())
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network('https://img.youtube.com/vi/fhzkeFiXfPI/0.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubeFrame extends StatefulWidget
{
  @override
  State<YoutubeFrame> createState() => _YoutubeFrameState();
}

class _YoutubeFrameState extends State<YoutubeFrame> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=kOh0CkVlTzQ')!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Player'),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          ),
        ],
      ),
    );
  }
}