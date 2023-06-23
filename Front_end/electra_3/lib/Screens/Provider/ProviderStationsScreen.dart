import 'dart:convert';

import 'package:electra/Screens/Provider/AddStationScreen.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/StationCard.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:electra/services/api/provider_api.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ProviderStation extends StatefulWidget {
  const ProviderStation({super.key});

  @override
  State<ProviderStation> createState() => _ProviderStationState();
}

class _ProviderStationState extends State<ProviderStation> {
  List listStation = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    synchronizationGetStation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColor,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Stations",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              kVSpace16,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add Your Station",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.push(view: const AddStation());
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 40,
                        color: kcolorsgerrn,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              kVSpace16,
              ListView(
                shrinkWrap: true,
                children: [
                  for (var itme in listStation) StationCard(listStation: itme)
                ],
              ),
              Visibility(
                visible: isLoading,
                child: const Center(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: RiveAnimation.asset(
                          'assets/icons/ElectraLoader.riv')),
                  //  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  synchronizationGetStation() async {
    if ((await getStation()).statusCode == 200) {
      isLoading = false;
      listStation = json.decode((await getStation()).body);
      listStation = List.from(listStation.reversed);
      print(listStation);
      setState(() {});
    }
  }
}
