import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constatnt.dart';
import 'package:netflix/presentation/search/widget/sreach_title.dart';

// const imagUrl = "asset/image/GOT.jpg";

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.4,
                children: List.generate(
                  21,
                  (index) {
                    final movie = state.searchResultList[index];
                    return MainCard(imageUrl: movie.posterImageUrl);
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
