import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/Screens/DiscScreens/web_view_screen.dart';
import '../../constant.dart';
import 'dart:ui' as ui;

class DiscScreens extends StatelessWidget {

  int id;
  num vote_average;
  String title;
  String overview;
  String poster_path;

  DiscScreens({
    required this.id,
    required this.vote_average,
    required this.title,
    required this.overview,
    required this.poster_path,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(image_url+poster_path,
            fit: BoxFit.cover,
          ),
          BackdropFilter(filter: ui.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            top: 35,
            left: 20,
              child: Container(
                child: TextButton.icon(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,),
                    label: Text(
                        "Back",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800
                    ),
                    ),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 35,top: 270,bottom: 0),
            child: Card(
              color: Colors.white.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 160, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 70,
                            child: Text(
                              "$title",
                              style: TextStyle(
                                color: black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 25,
                            child: Text(
                              "$vote_average/10",
                              style: TextStyle(
                                color: black,
                                fontSize: 25,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "$overview",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: const Alignment(0.0, -1),
                  begin: const Alignment(0.0, 0.4),
                  colors: <Color>[
                    const Color(0xffffffff),
                    Colors.white.withOpacity(0.0)
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 160),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 15,
                  shadowColor: Colors.blue,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(image_url+poster_path,
                      fit: BoxFit.fill,
                      height: 320,
                      width: 220,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: FloatingActionButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return WebViewScreen(title);
                        }));
                      },
                    backgroundColor: Colors.red.withOpacity(0.7),
                    elevation: 5,
                    child: Icon(Icons.play_arrow,color: black,),
                    autofocus: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}