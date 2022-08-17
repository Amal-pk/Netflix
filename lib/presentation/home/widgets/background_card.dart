import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/width.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: width,
          height: height / 1.8,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(mainImage),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                icon: Icons.add,
                title: 'My List',
              ),
              _playButton(),
              const CustomButtonWidget(
                icon: Icons.info_outline,
                title: 'Info',
              ),
            ],
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: (() {}),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(whiteclr)),
      icon: const Icon(
        Icons.play_arrow,
        color: blackclr,
        size: 25,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(
            color: blackclr,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
