import 'package:flutter/material.dart';
import 'package:netflix/core/width.dart';
import 'package:netflix/presentation/search/widget/sreach_title.dart';

const imageUrl = "asset/image/GOT.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV"),
        heightTWN,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.5,
            children: List.generate(
              21,
              (index) {
                return const MainCard();
              },
            ),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(imageUrl),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
