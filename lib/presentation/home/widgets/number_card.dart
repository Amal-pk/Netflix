import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constatnt.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget(
      {Key? key, required this.index, required this.imageUrl})
      : super(key: key);
  final int index;
  final String imageUrl;

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
                borderRadius: kBorder20,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
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
