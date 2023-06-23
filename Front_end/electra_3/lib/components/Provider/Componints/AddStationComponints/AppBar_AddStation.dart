// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

class AppBar_AddStation extends StatelessWidget {
  const AppBar_AddStation({
    super.key,
    required this.title,
    required this.icon,
    required this.page,
  });
  final String title;
  final IconData icon;
  final page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              context.pop(view: page);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: kcolorsgrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 30,
                color: kcolorsgerrn,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          klHSpace32,
        ],
      ),
    );
  }
}
