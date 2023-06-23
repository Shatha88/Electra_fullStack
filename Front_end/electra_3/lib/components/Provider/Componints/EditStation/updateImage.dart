// ignore_for_file: file_names, camel_case_types

import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/material.dart';

class updateImage extends StatelessWidget {
  const updateImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
          color: kcolorsgrey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.image,
                    size: 30,
                    color: Colors.grey,
                  ),
                  kHSpace16,
                  Text(
                    "add image",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.upload,
                size: 25,
                color: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
