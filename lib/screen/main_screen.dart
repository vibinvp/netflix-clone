import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/pages.dart';

import 'widgets/bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = [
    const HomePage(),
    const NewAndHotPage(),
    FastLaughsPage(),
    const SearchPage(),
    const DownloadsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexnotifier,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar:const SizedBox(
        height: 49,
        width: double.maxFinite,
        child: BottomNavBar(),
      ),
    );
  }
}
