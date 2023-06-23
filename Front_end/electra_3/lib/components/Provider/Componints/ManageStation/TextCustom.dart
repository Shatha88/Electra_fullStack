// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextCustum extends StatelessWidget {
  const TextCustum({
    super.key,
    required this.titel,
  });

  final String titel;

  @override
  Widget build(BuildContext context) {
    return Text(
      titel,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}