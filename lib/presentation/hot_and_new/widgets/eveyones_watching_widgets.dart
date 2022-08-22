import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryOnesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightTN,
        VideoWidget(
          url: posterPath,
        ),
        heightTWN,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textSize: 20,
            ),
            widthTN,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 20,
            ),
            widthTN,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 20,
            ),
            widthTN,
          ],
        ),
        heightTWN,
        Text(movieName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        heightTN,
        Text(
          description,
          style: TextStyle(fontSize: 13),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
