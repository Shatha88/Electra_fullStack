import 'package:electra/Screens/Auth/login_page.dart';
import 'package:electra/Screens/Auth/signup_page.dart';
import 'package:electra/components/button_custom.dart';
import 'package:flutter/material.dart';

import '../../constents/colors_theme.dart';
import '../../constents/spaces.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var screenV = MediaQuery.of(context).size.height;
    // var screenH = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            // height: screenV / 2,
            color: Colors.white,
            child: const Image(
                image: AssetImage("assets/images/aaa-removebg-preview.png"),
                fit: BoxFit.fitWidth,
                width: double.infinity),
          ),
          kVSpace16,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                "Welcome to ",
                style: TextStyle(
                  color: headersColor,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Text("ELECTRA",
                    style: TextStyle(
                      color: headersColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
          kVSpace16,
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Find the station closest to you, or view your station with simple steps, right at your fingertips.You are one step away.",
              style: TextStyle(color: txtFieldColor, fontSize: 16),
            ),
          ),
          kVSpace16,
          kVSpace16,
          kVSpace16,
          const ButtonCustom(title: 'Regester', forward: true, screen: SignupPage()),
          kVSpace16,
          const ButtonCustom(
              title: 'Login', forward: true, width: 126, screen: LoginPage()),
          kVSpace16,
          kVSpace16,
          kVSpace16,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                "",
                style: TextStyle(color: headersColor, fontSize: 16),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
