import 'package:flutter/material.dart';
import 'Home.dart';
import 'Ads.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BannerJ(),
      appBar: AppBar(
        backgroundColor: Color(0xfffff),
        title: Text("PUBG Wallpapers"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfffc5c65),
      body: Home(),
    );
  }
}
