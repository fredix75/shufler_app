import 'package:flutter/material.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

class VimeoFrame extends StatefulWidget {

  String lien;

  VimeoFrame(this.lien);

  @override
  _VimeoFrameState createState() => _VimeoFrameState();
}

class _VimeoFrameState extends State<VimeoFrame> {
  String videoId = '46233381';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vimeo Player'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: VimeoPlayer(
                videoId: videoId,
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}