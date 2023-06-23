// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class textCustom extends StatelessWidget {
  const textCustom({
    super.key,
    required this.titel,
  });
  final String titel;

  @override
  Widget build(BuildContext context) {
    return Text(
      titel,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
