import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class CacheImageJ extends StatefulWidget {
  String url;
  CacheImageJ({this.url});
  @override
  _CacheImageJState createState() => _CacheImageJState();
}

class _CacheImageJState extends State<CacheImageJ> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      placeholder: (context, lel) {
        return LinearProgressIndicator(
          backgroundColor: Colors.amberAccent[100],
        );
      },
      errorWidget: (context, lel, dyn) {
        return Icon(Icons.error_outlined);
      },
    );
  }
}
