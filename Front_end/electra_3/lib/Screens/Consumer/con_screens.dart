import 'package:electra/Screens/Consumer/con_home.dart';
import 'package:electra/Screens/Consumer/con_order.dart';
import 'package:electra/Screens/Consumer/con_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConScreens extends StatefulWidget {
  const ConScreens({super.key});

  @override
  State<ConScreens> createState() => _ConScreensState();
}

class _ConScreensState extends State<ConScreens> {
  int currentIndex = 1;
  List views = [
    const ConsumerOrder(),
    const ConHome(),
    const ConsumerProfile()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: currentIndex,
          onTap: (value) => currentIndex = value,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return views[currentIndex];
            },
          );
        });
  }
}
