import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              Row(
                children: [
                  Text(
                    movieName,
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notifications_none_rounded,
                        title: "Remind Me",
                        iconSize: 20,
                        textSize: 16,
                      ),
                      widthTN,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 16,
                      ),
                    ],
                  ),
                ],
              ),
              heightTN,
              const Text(
                "Coming on Friday",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              heightTN,
              Text(movieName,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              heightTN,
              Text(
                style: TextStyle(fontSize: 13),
                description,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
