import 'dart:core';

import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/AppBar_AddStation.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/textCustom.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/textFeldCustom.dart';
import 'package:electra/components/Provider/Componints/ManageStation/TextCustom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageStation extends StatefulWidget {
  const ManageStation({super.key, this.stationId = ''});
  final String stationId;

  @override
  State<ManageStation> createState() => _ManageStationState();
}

class _ManageStationState extends State<ManageStation> {
  late DateTime fromDateTime;
  late DateTime toDateTime;
  late String formateFromDateTime;
  late String formateToDateTime;

  @override
  void initState() {
    // TODO: implement initState
    fromDateTime = DateTime(2023, 20, 25, 12);
    toDateTime = DateTime(2023, 20, 25, 12);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBar_AddStation(
                  title: "Station ID: ${widget.stationId}",
                  icon: Icons.chevron_left,
                  page: const ProviderStation(),
                ),
              ),
              const Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      height: 200,
                      width: 300,
                      image: AssetImage("assets/images/charging-station.png")),
                ),
              ),
              kVSpace16,
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextCustum(
                    titel: "Add a working time",
                  ),
                ),
              ),
              kVSpace32,
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const TextCustum(titel: "From"),
                            kVSpace8,
                            SizedBox(
                              height: 40,
                              width: 130,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonBGColor,
                                ),
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 300,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Donr"),
                                            ),
                                            Expanded(
                                              child: CupertinoDatePicker(
                                                initialDateTime: fromDateTime,
                                                mode: CupertinoDatePickerMode
                                                    .dateAndTime,
                                                onDateTimeChanged: (date) {
                                                  setState(() {
                                                    fromDateTime = date;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Chose Time",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: kcolorsgrey,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            kVSpace16,
                            TextCustum(
                              titel:
                                  "${fromDateTime.day}-${fromDateTime.month}  ${fromDateTime.hour}:${fromDateTime.minute}",
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const TextCustum(titel: "To"),
                            kVSpace8,
                            SizedBox(
                              height: 40,
                              width: 130,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonBGColor,
                                ),
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 300,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Donr"),
                                            ),
                                            Expanded(
                                              child: CupertinoDatePicker(
                                                initialDateTime: toDateTime,
                                                mode: CupertinoDatePickerMode
                                                    .dateAndTime,
                                                onDateTimeChanged: (date) {
                                                  setState(() {
                                                    toDateTime = date;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Chose Time",
                                        style: TextStyle(fontSize: 13)),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: kcolorsgrey,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            kVSpace16,
                            TextCustum(
                              titel:
                                  "${toDateTime.day}-${toDateTime.month}  ${toDateTime.hour}:${toDateTime.minute}",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              kVSpace16,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: textCustom(titel: "Add price")),
                    kVSpace8,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 40,
                        width: 150,
                        child: textfeldecustom(
                          titel: "Price",
                          iconData: Icons.price_change_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kVSpace32,
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonBGColor,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added Successfully...')));
                  },
                  child: const Text("Add Service"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
