import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width, this.fit }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final BoxFit fit;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
