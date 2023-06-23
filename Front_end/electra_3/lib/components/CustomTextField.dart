// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../constents/colors_theme.dart';

class mTextField extends StatelessWidget {
  const mTextField({
    super.key,
    required this.hint,
    required this.label,
    this.icon = Icons.icecream,
    this.isPassword,
    this.controller,
    this.onChanged,
    this.onPressed,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final String hint;
  final String label;
  final IconData icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onPressed;
  final bool obscureText;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        enabled: true,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        obscuringCharacter: "*",
        cursorColor: greenGradient,
        cursorWidth: 6,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),

          // labelText: label,
          // prefixIcon: Icon(
          //   icon,
          //   color: Colors.red,
          // ),
          // suffixIcon: isPassword!
          //     ? IconButton(
          //         onPressed: onPressed,
          //         icon: const Icon(
          //           LineIcons.eye,
          //           color: Colors.black54,
          //         ))
          //     : null,
          suffixIcon: (isPassword == false)
              ? IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    LineIcons.eye,
                    color: Colors.black54,
                  ))
              : (isPassword == true)
                  ? IconButton(
                      onPressed: onPressed,
                      icon: const Icon(
                        LineIcons.eyeSlash,
                        color: Colors.black54,
                      ))
                  : (isPassword == null)
                      ? null
                      : null,
          labelStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
