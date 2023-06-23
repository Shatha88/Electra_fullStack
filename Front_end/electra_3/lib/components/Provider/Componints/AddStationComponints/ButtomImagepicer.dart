// ignore_for_file: file_names

import 'dart:io';

import 'package:electra/constents/colors_theme.dart';
import 'package:electra/services/api/provider_api.dart';
import 'package:flutter/material.dart';

class ElvatedButtonImangePicker extends StatelessWidget {
  const ElvatedButtonImangePicker({
    super.key,
    required this.image,
  });

  final File image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kcolorsgerrn,
        ),
        onPressed: () async {
          final response = await AddImageStation(body: image);
          // print(response.body);
        },
        child: const Text("Add Station"),
      ),
    );
  }
}
