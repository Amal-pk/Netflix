import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_card_and_title.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
    });
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                          child: Text(
                        'Error While getting data',
                        style: TextStyle(color: Colors.white),
                      ));
                    }

                    //released past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.backdropPath}';
                    }).toList();

                    // trending
                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.backdropPath}';
                    }).toList();
                    _trending.shuffle();
                    //tense dreams
                    final _tenseDreams = state.tensDramaMovieList.map((m) {
                      return '$imageAppendUrl${m.backdropPath}';
                    }).toList();
                    _tenseDreams.shuffle();
                    //southindian Movies

                    final _southIndianMovies =
                        state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.backdropPath}';
                    }).toList();
                    _southIndianMovies.shuffle();

                    final _topTenMovies = state.trendingMovieList.map((t) {
                      return '$imageAppendUrl${t.backdropPath}';
                    }).toList();
                    _topTenMovies.shuffle();

                    return ListView(
                      children: [
                        const BackgroundCard(),
                        MainCardAndTitle(
                          title: 'Released in the past year',
                          posterList: _releasedPastYear.sublist(0, 10),
                        ),
                        MainCardAndTitle(
                          title: 'Trending Now',
                          posterList: _trending.sublist(0, 10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heightTN,
                            NumberTitleCard(
                              posterList: _topTenMovies.sublist(0, 10),
                            ),
                            heightTN
                          ],
                        ),
                        MainCardAndTitle(
                          title: 'Tense Dreams',
                          posterList: _tenseDreams.sublist(0, 10),
                        ),
                        heightTN,
                        MainCardAndTitle(
                          title: 'South Indian Cinema',
                          posterList: _southIndianMovies.sublist(0, 10),
                        )
                      ],
                    );
                  },
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
                                Text('TV Shows', style: kHomeTitlText),
                                Text("Movies", style: kHomeTitlText),
                                Text("Categories", style: kHomeTitlText)
                              ],
                            )
                          ],
                        ),
                      )
                    : heightTN
              ],
            ),
          );
        },
      ),
    );
  }
}
