// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class textcustomOrder extends StatelessWidget {
  const textcustomOrder({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff938E8E),
          ),
        ),
      ),
    );
  }
}
