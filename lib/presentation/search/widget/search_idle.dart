import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/width.dart';
import 'package:netflix/presentation/search/widget/sreach_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Top Searchs"),
        heightTN,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return const TopSearchItemTile();
            },
            itemBuilder: (BuildContext context, int index) {
              return heightTWN;
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: width / 3,
          height: height / 9,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image:
                  AssetImage('asset/image/wp6941118-laptop-4k-wallpapers.jpg'),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: whiteclr,
          size: 35,
        )
      ],
    );
  }
}
