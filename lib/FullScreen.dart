import 'package:flutter/material.dart';
import 'CacheImage.dart';

// ignore: must_be_immutable
class FullScreenImage extends StatefulWidget {
  String url;
  FullScreenImage({this.url});
  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Walls"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CacheImageJ(
          url: widget.url,
        ),
      ),
    );
  }
}
