import 'package:electra/Screens/Consumer/con_home.dart';
import 'package:electra/Screens/Consumer/con_order.dart';
import 'package:electra/Screens/Consumer/con_profile.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:flutter/material.dart';


class ConsumerMain extends StatefulWidget {
  const ConsumerMain({super.key});

  @override
  State<ConsumerMain> createState() => _ConsumerMainState();
}

class _ConsumerMainState extends State<ConsumerMain> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const ConHome(),
    const ConsumerOrder(),
    const ConsumerProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: Colors.deepPurple.shade900,
        ),
        selectedItemColor: kcolorsgerrn,
        unselectedIconTheme: const IconThemeData(color: txtFieldBGColor),
        unselectedItemColor: txtFieldBGColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
                decoration: BoxDecoration(
                    color: txtFieldBGColor,
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.home_outlined,
                  size: 18,
                  color: kcolorsgerrn,
                )),
            label: 'Home',
            activeIcon: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          greenGradient,
                          purpleGradient,
                        ]),
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.home_outlined,
                  size: 18,
                  color: txtFieldBGColor,
                )),
          ),
          //Orders
          BottomNavigationBarItem(
            icon: Container(
                decoration: BoxDecoration(
                    color: txtFieldBGColor,
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.format_list_bulleted_rounded,
                  size: 18,
                  color: kcolorsgerrn,
                )),
            label: 'Orders',
            activeIcon: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          greenGradient,
                          purpleGradient,
                        ]),
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.format_list_bulleted_rounded,
                  size: 18,
                  color: txtFieldBGColor,
                )),
          ),
          //Profile
          BottomNavigationBarItem(
            icon: Container(
                decoration: BoxDecoration(
                    color: txtFieldBGColor,
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.person_2_outlined,
                  size: 18,
                  color: kcolorsgerrn,
                )),
            label: 'Profile',
            activeIcon: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          greenGradient,
                          purpleGradient,
                        ]),
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.person_2_outlined,
                  size: 18,
                  color: txtFieldBGColor,
                )),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// import 'package:electra/Screens/Consumer/con_home.dart';
// import 'package:electra/Screens/Consumer/con_order.dart';
// import 'package:electra/constents/colors_theme.dart';
// import 'package:flutter/material.dart';

// class ConsumerMain extends StatefulWidget {
//   const ConsumerMain({super.key});

//   @override
//   State<ConsumerMain> createState() => _ConsumerMainState();
// }

// class _ConsumerMainState extends State<ConsumerMain> {
//   int _selectedIndex = 0;
//   final List<Widget> _pages = <Widget>[
//     const ConHome(),
//     const ConsumerOrder(),
//     // const ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _pages.elementAt(_selectedIndex), //New
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedIconTheme: IconThemeData(
//           color: Colors.deepPurple.shade900,
//         ),
//         selectedItemColor: kcolorsgerrn,
//         unselectedIconTheme: const IconThemeData(color: txtFieldBGColor),
//         unselectedItemColor: txtFieldBGColor,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Container(
//                 decoration: BoxDecoration(
//                     color: txtFieldBGColor,
//                     borderRadius: BorderRadius.circular(14)),
//                 padding: const EdgeInsets.all(8),
//                 child: const Icon(
//                   Icons.home_outlined,
//                   size: 18,
//                   color: kcolorsgerrn,
//                 )),
//             label: 'Home',
//             activeIcon: Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [
//                           greenGradient,
//                           purpleGradient,
//                         ]),
//                     borderRadius: BorderRadius.circular(14)),
//                 padding: const EdgeInsets.all(8),
//                 child: const Icon(
//                   Icons.home_outlined,
//                   size: 18,
//                   color: txtFieldBGColor,
//                 )),
//           ),
//           //Orders
//           BottomNavigationBarItem(
//             icon: Container(
//                 decoration: BoxDecoration(
//                     color: txtFieldBGColor,
//                     borderRadius: BorderRadius.circular(14)),
//                 padding: const EdgeInsets.all(8),
//                 child: const Icon(
//                   Icons.format_list_bulleted_rounded,
//                   size: 18,
//                   color: kcolorsgerrn,
//                 )),
//             label: 'Orders',
//             activeIcon: Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [
//                           greenGradient,
//                           purpleGradient,
//                         ]),
//                     borderRadius: BorderRadius.circular(14)),
//                 padding: const EdgeInsets.all(8),
//                 child: const Icon(
//                   Icons.format_list_bulleted_rounded,
//                   size: 18,
//                   color: txtFieldBGColor,
//                 )),
//           ),
//           //Profile
//           BottomNavigationBarItem(
//             icon: Container(
//                 decoration: BoxDecoration(
//                     color: txtFieldBGColor,
//                     borderRadius: BorderRadius.circular(14)),
//                 padding: const EdgeInsets.all(8),
//                 child: const Icon(
//                   Icons.person_2_outlined,
//                   size: 18,
//                   color: kcolorsgerrn,
//                 )),
//             label: 'Profile',
//             activeIcon: Container(
//                 decoration: BoxDecoration(
//                     color: kcolorsgrey,
//                     borderRadius: BorderRadius.circular(14)),
//                 padding: const EdgeInsets.all(8),
//                 child: const Icon(
//                   Icons.person_2_outlined,
//                   size: 18,
//                   color: txtFieldBGColor,
//                 )),
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
