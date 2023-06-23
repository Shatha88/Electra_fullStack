import 'package:electra/Screens/Provider/OrdersScreen.dart';
import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/Screens/Provider/SettingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 1;
  List views = [
    const OrdersPage(),
    const ProviderStation(),
    const SettingScreen()
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
