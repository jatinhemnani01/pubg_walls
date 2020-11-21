import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'FullScreen.dart';
import 'CacheImage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  bool isLoaded = false;
  Future getData() async {
    try {
      var response = await http.get(
          "https://raw.githubusercontent.com/jatinhemnani01/pubg_walls/main/data.json");
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        setState(() {
          isLoaded = true;
        });
      }
    } catch (e) {
      setState(() {
        isLoaded = false;
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  var responses;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: responses = http.get(
            "https://raw.githubusercontent.com/jatinhemnani01/pubg_walls/main/data.json"),
        builder: (context, snapshot) {
          return isLoaded
              ? Container(
                  color: Colors.amber[200],
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: data == null ? 0 : data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => FullScreenImage(
                                          url: data[index]["url"],
                                        )));
                          },
                          child: Container(
                            color: Colors.black45,
                            child: CacheImageJ(
                              url: data[index]["url"],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
