import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/width.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    const BackgroundCard(),
                    const MainTitleCard(title: "Released in the past year"),
                    const MainTitleCard(title: "Trending Now"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heightTN,
                        const MainTitle(
                          title: "Top 10 Tv Shows In India Today",
                        ),
                        heightTN,
                        LimitedBox(
                          maxHeight: height / 4,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: List.generate(
                              10,
                              (index) => NumberCard(index: index),
                            ),
                          ),
                        )
                      ],
                    ),
                    const MainTitleCard(title: "Tense Drames"),
                    const MainTitleCard(title: "South Indian Cinema")
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: width,
                        height: height / 9,
                        color: Colors.black26,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                heightTWN,
                                widthTN,
                                Image.asset(
                                  'asset/image/netflix-removebg-preview.png',
                                  height: 50,
                                  width: 50,
                                ),
                                Spacer(),
                                const Icon(
                                  Icons.cast_rounded,
                                  color: whiteclr,
                                ),
                                widthTN,
                                Container(
                                  height: 25,
                                  width: 25,
                                  color: Colors.blueGrey,
                                ),
                                widthTN
                              ],
                            ),
                            heightTN,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV Shows', style: homeStyle),
                                Text("Movies", style: homeStyle),
                                Text("Categories", style: homeStyle)
                              ],
                            )
                          ],
                        ),
                      )
                    : heightTN,
              ],
            ),
          );
        },
      ),
    );
  }
}
