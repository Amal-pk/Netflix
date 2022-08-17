import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: bgcolor,
            currentIndex: newIndex,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection_outlined),
                  label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.insert_emoticon_sharp), label: 'Fast Laugh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down_sharp), label: 'Download'),
            ]);
      },
    );
  }
}
