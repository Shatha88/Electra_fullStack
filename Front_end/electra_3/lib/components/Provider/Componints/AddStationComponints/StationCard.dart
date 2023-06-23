// ignore_for_file: file_names

import 'package:electra/Screens/Provider/EditStationScreen.dart';
import 'package:electra/Screens/Provider/ManageStationScreen.dart';
import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StationCard extends StatelessWidget {
  const StationCard({
    super.key,
    required this.listStation,
  });
  final Map listStation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: kcolorsgerrn,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8,bottom: 8,right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Station ID : ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      kHSpace8,
                      Text(
                        "${int.parse(listStation["id"].toString())}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const TextCustom(
                        text: "Charge power:",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      kHSpace8,
                      TextCustom(
                        text: listStation["rating"],
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(listStation["location"])),
                    child: const Text(
                      "Station Location",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.push(
                          view: EditStation(
                        id: listStation["id"],
                      ));
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kcolorsgrey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: kcolorsgerrn,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(
                          view: ManageStation(
                              stationId: listStation['id'].toString()));
                    },
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: kcolorsgrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Add Service",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kcolorsgerrn,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
