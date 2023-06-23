// ignore_for_file: use_build_context_synchronously, file_names

import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/services/api/provider_api.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

class ElecatedButtonAddStation extends StatelessWidget {
  const ElecatedButtonAddStation({
    super.key,
    required this.ratingvalue,
    required this.locationgvalue,
  });

  final String ratingvalue;
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
          final Map body = {"rating": ratingvalue, "location": locationgvalue};
          final response = await Addstation(body: body);
          if (response.statusCode == 200) {
            context.push(view: const ProviderStation());
          }
        },
        child: const Text("Add Station"),
      ),
    );
  }
}
