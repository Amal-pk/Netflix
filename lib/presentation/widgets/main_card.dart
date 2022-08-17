import 'package:flutter/material.dart';
import 'package:netflix/core/width.dart';

class MainCardH extends StatelessWidget {
  const MainCardH({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: width / 3,
        height: height / 3,
        decoration: BoxDecoration(
          borderRadius: bRadius10,
          image: const DecorationImage(
            image: AssetImage('asset/image/peaky Blinders.jpg'),
          ),
        ),
      ),
    );
  }
}
