
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlifx_cross/styles.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Downloads",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              const Icon(CupertinoIcons.video_camera_solid),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 20,
                  width: 20,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.settings,
                  color: Colors.white,
                ),
              ),
              Text(
                "Smart Downloads",
                style: TextStyle(color: white, fontSize: 20),
              )
            ],
          ),
          kHeight,
          const Text(
            "Introducing Downloads for you",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          kHeight,
          kHeight,
          const Text(
            "We will download a personilised selection of movies and shows for you,so there's always somenthing to watch on your device.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(
            height: 60,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            radius: 150,
            child: Stack(children: const [
              DownloadImage(imgUrl:  "https://www.themoviedb.org/t/p/original/yGToGjAZ66awFp017hppmsYqdjb.jpg", angle: 10),
              
              DownloadImage(imgUrl:  "https://www.themoviedb.org/t/p/w500/etcyywl7weDazvZ7Jh2RCNqdnIG.jpg", angle: -10),
              DownloadImage(imgUrl: "https://www.themoviedb.org/t/p/original/1IFXkHuWdG3i1WUAW3jC7DR609o.jpg", angle: 0),
            ]),
          ),
        ],
      ),
    );
  }
}

class DownloadImage extends StatelessWidget {
  final String imgUrl;
  final double angle;

  const DownloadImage({
    Key? key, required this.imgUrl, required this.angle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 100,
      child: Container(
        height: 250,
        width: 130,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                 imgUrl),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
