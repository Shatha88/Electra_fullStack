// ignore_for_file: file_names

import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/AppBar_AddStation.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/addStationContaner.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/material.dart';

class AddStation extends StatelessWidget {
  const AddStation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: const [
              AppBar_AddStation(
                title: "Add Station",
                icon: Icons.close,
                page: ProviderStation(),
              ),
              kVSpace64,
              addStationContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
