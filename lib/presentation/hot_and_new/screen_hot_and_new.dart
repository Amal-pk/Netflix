import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/width.dart';

class ScreenHotAndNew extends StatelessWidget {
  const ScreenHotAndNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: whiteclr,
                ),
              ),
              actions: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cast_rounded,
                        color: whiteclr,
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      color: Colors.blueGrey,
                    ),
                    widthTN
                  ],
                )
              ],
              bottom: TabBar(
                  labelColor: blackclr,
                  isScrollable: true,
                  unselectedLabelColor: whiteclr,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  indicator: BoxDecoration(
                    color: whiteclr,
                    borderRadius: bRadius30,
                  ),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    )
                  ]),
            ),
          ),
          body: TabBarView(
            children: [
              _bulidComingSoon(context),
              _bulidEveryoneWatchimg(context),
            ],
          )),
    );
  }

  _bulidComingSoon(context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        heightTN,
        Row(
          children: [
            SizedBox(
              width: width / 7,
              height: height / 1.8,
              child: Column(
                children: const [
                  Text(
                    "FEB",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "11",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width / 1.2,
              height: height / 1.8,
              child: Column(
                children: [
                  Container(
                    // color: Colors.red,
                    width: width,
                    height: height / 3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('asset/image/download.jpg'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _bulidEveryoneWatchimg(context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox();
  }
}
