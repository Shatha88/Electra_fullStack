import 'package:electra/constents/colors_theme.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    this.fontSize = 30,
    required this.title,
    this.width = 100,
    this.hight = 10,
    required this.forward,
    this.buttonColor = buttonBGColor,
    this.textColor = buttontxtColor,
    required this.screen,
  });
  final String title;
  final double width;
  final double hight;
  final double fontSize;
  final bool forward;
  final Color buttonColor;
  final Color textColor;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          padding: EdgeInsets.symmetric(horizontal: width, vertical: hight)),
      onPressed: () {
        // Respond to button press
        if (forward) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        } else {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => screen),
                (route) => false);
          }
        }
      },
      child: Text(
        title,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }
}
