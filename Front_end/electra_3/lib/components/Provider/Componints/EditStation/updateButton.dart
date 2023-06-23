// ignore_for_file: camel_case_types, file_names, use_build_context_synchronously

import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/services/api/provider_api.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

class updateButton extends StatelessWidget {
  const updateButton({
    super.key,
    required this.locationgvalue,
  });
  final String locationgvalue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kcolorsgerrn,
        ),
        onPressed: () async {
          final Map body = {"location": locationgvalue};
          final response = await updateStation(body: body);
          if (response.statusCode == 200) {
            context.push(view: const ProviderStation());
          }
        },
        child: const Text("Update"),
      ),
    );
  }
}
