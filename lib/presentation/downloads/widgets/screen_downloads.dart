import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/width.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({Key? key}) : super(key: key);
  final _widgetList = [
    const _SmartDownload(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: _widgetList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return _widgetList[index];
        },
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  final List imageList = [
    "asset/image/pH.jpeg",
    "asset/image/minions.jpeg",
    "asset/image/Breaking Bad.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(children: [
      const Text(
        'Introducing Downloads for you',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        "We will download a personalised selection of\nmovies and shows for you ,so there's\nalways something to watch on your\ndevice",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
      SizedBox(
        width: size.width,
        height: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
              radius: size.width * 0.39,
            ),
            DownloadsImageWidgets(
              imageList: imageList[0],
              margin: EdgeInsets.only(left: 170, top: 50),
              angle: 25,
              size: Size(size.width * 0.35, size.width * 0.55),
            ),
            DownloadsImageWidgets(
              imageList: imageList[1],
              margin: EdgeInsets.only(right: 170, top: 50),
              angle: -25,
              size: Size(size.width * 0.35, size.width * 0.55),
            ),
            DownloadsImageWidgets(
              imageList: imageList[2],
              margin: EdgeInsets.only(bottom: 10, top: 50),
              size: Size(size.width * 0.4, size.width * 0.65),
            ),
          ],
        ),
      ),
    ]);
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: bottonclrblue,
            onPressed: (() {}),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                  color: whiteclr,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        MaterialButton(
          color: bottonclrwhite,
          onPressed: (() {}),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: blackclr, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownload extends StatelessWidget {
  const _SmartDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        widthTN,
        Icon(
          Icons.settings,
          color: whiteclr,
        ),
        widthTN,
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
