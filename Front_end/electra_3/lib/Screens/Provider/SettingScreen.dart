// ignore_for_file: file_names

// import 'package:electra/Screens/Auth/login_page.dart';
import 'package:electra/Screens/routing_screen.dart';
import 'package:electra/components/Provider/Componints/SettingScreen/SettingAccountData.dart';
import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: TextCustom(
                text: "Setting",
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            kVSpace64,
            ListView(
              shrinkWrap: true,
              children: [
                const SettingsTitle(
                  title: "Account",
                  icon: Icons.person_outline,
                ),
                const Divider(
                  thickness: 2,
                ),
                kVSpace8,
                const SettingAccountData(),
                kVSpace24,
                const SettingsTitle(
                  title: "Payment Card",
                  icon: Icons.credit_card,
                ),
                const Divider(
                  thickness: 2,
                ),
                kVSpace8,
                kVSpace64,
                kVSpace64,
                kVSpace64,
                kVSpace8,
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonBGColor, // Background color
                      ),
                      onPressed: () {
                        // print("here i am");
                        box.erase();
                        // print(box.getKeys());

                        // context.pushAndRemoveCup(view: const RoutingScreen());
                        Navigator.of(context, rootNavigator: true)
                            .pushAndRemoveUntil(
                                CupertinoModalPopupRoute(
                                    builder: (context) =>
                                        const RoutingScreen()),
                                (route) => false);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30,
                          ),
                          TextCustom(
                            text: "Logout",
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: buttonBGColor,
        ),
        kHSpace8,
        TextCustom(
          text: title,
          color: buttonBGColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
