import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/width.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
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
              const VideoWidget(),
              Row(
                children: [
                  const Text(
                    "Mortal Kombat",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
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
              const Text(
                "Mortal Kombat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              heightTN,
              const Text(
                "On the brink of being conquered by Outworld, Earthrealm fighters driven by an ancient prophecy must win the final tournament to save humanity.",
                style: TextStyle(
                  fontSize: 16,
                  color: greyclr,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
