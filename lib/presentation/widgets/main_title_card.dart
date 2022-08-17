import 'package:flutter/material.dart';
import 'package:netflix/core/width.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightTN,
        MainTitle(
          title: title,
        ),
        heightTN,
        LimitedBox(
          maxHeight: height / 4,
          child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(10, (index) => MainCardH())),
        )
      ],
    );
  }
}
