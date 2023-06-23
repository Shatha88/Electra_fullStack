import 'package:electra/Screens/Auth/start_screen.dart';
import 'package:electra/Screens/Consumer/con_screens.dart';
import 'package:electra/Screens/Provider/screens.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class RoutingScreen extends StatefulWidget {
  const RoutingScreen({super.key});

  @override
  State<RoutingScreen> createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return box.hasData('token')
        ? box.read('UserType').toString().contains('CONSUMER')
            ? const ConScreens()
            : const Screens()
        : const StartScreen();
  }
}
