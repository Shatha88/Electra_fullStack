
// ignore_for_file: file_names, camel_case_types

import 'package:electra/constents/colors_theme.dart';
import 'package:flutter/material.dart';

class updateBankAccount extends StatelessWidget {
  const updateBankAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 60,
        width: 300,
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            initialValue: "SA08 0986 5678 5678 6543",
            enabled: true,
            cursorColor: Colors.black,
            cursorWidth: 2,
            decoration: InputDecoration(
              fillColor: kcolorsgrey,
              filled: true,
              prefixIconColor: Colors.grey,
              suffixIconColor: Colors.grey,
              prefixIcon: const Icon(Icons.attach_money),
              suffixIcon: const Icon(Icons.edit),
              labelStyle: const TextStyle(color: Colors.black),
              border: const OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
