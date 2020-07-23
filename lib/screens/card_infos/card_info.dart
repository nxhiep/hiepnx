import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiepnx/components/photo_hero.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CardInfo extends StatefulWidget {

  final String url;
  CardInfo({ this.url });

  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {

  final List<String> _imageUrls = [
    "assets/images/con_ca_0.jpg",
    "assets/images/con_ca_1.jpg",
    "assets/images/con_ca_2.jpg",
    "assets/images/con_ca_3.jpg",
  ];

  final String _videoId = 'egUHdcyqMcc';
  
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    // _controller.play();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    print("deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          print('onReady!');
        },
        onEnded: (data) {
          print('Ended Video! $data');
        },
      ),
      builder: (_, Widget player) => Scaffold(
        appBar: AppBar(
          title: Text("Con cá - Fish"),
        ),
        body: ListView(
          children: <Widget>[
            PhotoHero(
              photo: widget.url,
              width: double.infinity,
              fit: BoxFit.cover,
              onTap: () {
                _showDialog();
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text("Con cá - Fish", style: TextStyle(fontSize: 25)),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // IconButton(
                //   icon: Icon(Icons.ondemand_video), 
                //   onPressed: () {
                //   }
                // ),
                IconButton(
                  icon: Icon(Icons.favorite), 
                  onPressed: () {
                    print("Love");
                  }
                ),
                IconButton(
                  icon: Icon(Icons.share), 
                  onPressed: () {
                    print("Share");
                  }
                ),
                // IconButton(
                //   icon: Icon(Icons.cloud_download), 
                //   onPressed: () {
                //     print("Download");
                //   }
                // ),
              ],
            ),
            player
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Center(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2,
                autoPlay: true,
                enlargeCenterPage: true,
                // viewportFraction: 1,
              ),
              items: _imageUrls.map((url) {
                return Image.asset(url, fit: BoxFit.contain);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}