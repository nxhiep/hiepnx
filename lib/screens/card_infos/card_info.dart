import 'package:flutter/material.dart';
import 'package:hiepnx/components/photo_hero.dart';

class CardInfo extends StatefulWidget {

  final String url;
  CardInfo({ this.url });

  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: PhotoHero(
          photo: widget.url,
          width: double.infinity,
          fit: BoxFit.cover,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}