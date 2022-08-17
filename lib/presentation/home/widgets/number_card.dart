import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/width.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: width / 10,
              height: height / 3,
            ),
            Container(
              width: width / 3,
              height: height / 3,
              decoration: BoxDecoration(
                borderRadius: bRadius10,
                image: const DecorationImage(
                  image: AssetImage('asset/image/all_dead_main_1.webp'),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: BorderedText(
            strokeWidth: 10,
            strokeColor: whiteclr,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: blackclr,
                fontWeight: FontWeight.w400,
                fontSize: 150,
                decoration: TextDecoration.none,
                decorationColor: blackclr,
              ),
            ),
          ),
        )
      ],
    );
  }
}
