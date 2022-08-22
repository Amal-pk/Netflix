import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/hot_and_new/widgets/coming_soon.dart';
import 'package:netflix/presentation/hot_and_new/widgets/eveyones_watching_widgets.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';

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
                  borderRadius: kBorder30,
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
        body: const TabBarView(
          children: [
            ComingSoonList(key: Key('coming_soon')),
            EveryoneIsWatching(
              key: Key('everyone_is_watching'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isLOading) {
            return Center(
              child: Text('Error while loading soon list'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return Center(
              child: Text('Coming soon list is empty'),
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.only(top: 18),
                itemCount: state.comingSoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  }
                  String month = '';
                  String date = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }

                  return ComingSoonWidget(
                    month: month,
                    id: movie.id.toString(),
                    day: date,
                    movieName: movie.originalTitle ?? 'No title',
                    posterPath: '$imageAppendUrl${movie.backdropPath}',
                    description: movie.overview ?? 'No Description',
                  );
                });
          }
        },
      ),
    );
  }
}

class EveryoneIsWatching extends StatelessWidget {
  const EveryoneIsWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(LoadDataInEveryoneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isLOading) {
            return Center(
              child: Text('Error while loading soon list'),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return Center(
              child: Text('Everyone is watching list is empty'),
            );
          } else {
            return ListView.builder(
                itemCount: state.everyOneIsWatchingList.length,
                itemBuilder: (context, index) {
                  final movie = state.everyOneIsWatchingList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  } else {
                    final tv = state.everyOneIsWatchingList[index];
                    return EveryOnesWatchingWidget(
                        posterPath: '$imageAppendUrl${movie.backdropPath}',
                        movieName: tv.originalName ?? 'No name provided',
                        description: tv.overview ?? 'No description');
                  }
                });
          }
        },
      ),
    );
  }
}
