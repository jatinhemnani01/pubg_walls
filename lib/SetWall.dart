import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SetWall extends StatefulWidget {
  SetWall({this.title, this.url});
  String url;
  String title;
  @override
  _SetWallState createState() => _SetWallState();
}

class _SetWallState extends State<SetWall> {
  var file;
  donewall(url) async {
    int location = WallpaperManager
        .BOTH_SCREENS; // or location = WallpaperManager.LOCK_SCREEN;
    file = await DefaultCacheManager().getSingleFile(url);
    // ignore: unused_local_variable
    await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(widget.title),
      onPressed: () {
        donewall(widget.url);
      },
      color: Colors.blue,
    );
  }
}
