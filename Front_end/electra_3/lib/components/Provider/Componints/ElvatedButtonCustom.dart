
// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:electra/constents/colors_theme.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';

import 'package:flutter/material.dart';

class ElvatedButtonCustom extends StatelessWidget {
  const ElvatedButtonCustom({
    super.key,
    required this.ButtonTitle,
    required this.page,
  });
  final String ButtonTitle;
  final page;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 163,
      decoration: BoxDecoration(
        color: kcolorsgerrn,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: () {
          context.push(view :page);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kcolorsgerrn,
        ),
        child: Text(
          ButtonTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
