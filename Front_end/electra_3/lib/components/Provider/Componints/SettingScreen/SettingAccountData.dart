// ignore_for_file: file_names

import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SettingAccountData extends StatefulWidget {
  const SettingAccountData({
    super.key,
  });

  @override
  State<SettingAccountData> createState() => _SettingAccountDataState();
}

class _SettingAccountDataState extends State<SettingAccountData> {
  final box = GetStorage();
  List profile = [];

  @override
  Widget build(BuildContext context) {
    profile = box.read('profile');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
           const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: "Name",
                color: Colors.black54,
                fontSize: 20,
              ),
              kVSpace16,
              TextCustom(
                text: "Email",
                color: Colors.black54,
                fontSize: 20,
              ),
              kVSpace16,
              TextCustom(
                text: "Phone",
                color: Colors.black54,
                fontSize: 20,
              ),
              kVSpace16,
              // TextCustom(
              //   text: "Address",
              //   color: Colors.black54,
              //   fontSize: 20,
              // ),
            ],
          ),
          klHSpace32,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: profile[0]['name'],
                color: Colors.black,
                fontSize: 18,
              ),
              kVSpace16,
              TextCustom(
                text: profile[0]['email'],
                color: Colors.black,
                fontSize: 18,
              ),
              kVSpace16,
              TextCustom(
                text: profile[0]['phone'],
                color: Colors.black,
                fontSize: 18,
              ),
              kVSpace16,
              // TextCustom(
              //   text: "Jeddah",
              //   color: Colors.black,
              //   fontSize: 18,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
