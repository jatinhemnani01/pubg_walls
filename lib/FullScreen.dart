import 'package:flutter/material.dart';
import 'CacheImage.dart';
import 'SetWall.dart';

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
      floatingActionButton: SetWall(
        title: "Set Wallpaper",
        url: widget.url,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Walls"),
      ),
      body: Container(
        color: Colors.black26,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CacheImageJ(
          url: widget.url,
        ),
      ),
    );
  }
}
