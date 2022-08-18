import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/width.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/hot_and_new/widgets/coming_soon.dart';
import 'package:netflix/presentation/hot_and_new/widgets/eveyones_watching_widgets.dart';

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
              _bulidComingSoon(),
              _bulidEveryoneWatchimg(context),
            ],
          )),
    );
  }

  _bulidComingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => const ComingSoonWidget());
  }

  _bulidEveryoneWatchimg(context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) =>
            const EveryOnesWatchingWidget());
  }
}
