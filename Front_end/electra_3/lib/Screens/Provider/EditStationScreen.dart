// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/AppBar_AddStation.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/textCustom.dart';
import 'package:electra/components/Provider/Componints/EditStation/ElecatedButtonDeleteStation.dart';
import 'package:electra/components/Provider/Componints/EditStation/gitLocation.dart';
import 'package:electra/components/Provider/Componints/EditStation/updateButton.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class EditStation extends StatefulWidget {
  const EditStation({super.key, required this.id});

  @override
  State<EditStation> createState() => _EditStationState();
  final int id;
}

class _EditStationState extends State<EditStation> {
  late String lat;
  late String long;
  String locationMessage = "";
  File? image;
  Future PickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (_) {
      showSnackBar('Failed to pick image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const AppBar_AddStation(
                title: "Edit Station",
                icon: Icons.chevron_left,
                page: ProviderStation(),
              ),

              kVSpace8,
              // Image(
              //   height: 200,
              //   width: 200,
              //   image: AssetImage("assets/images/EDitstaion.jpg"),
              // ),
              kVSpace64,
              const Align(
                  alignment: Alignment.centerLeft,
                  child: textCustom(titel: "Update Station Image")),
              kVSpace8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              kVSpace8,
                              InkWell(
                                onTap: () => PickImage(),
                                child: DottedBorder(
                                  color:
                                      Colors.grey, //color of dotted/dash line
                                  strokeWidth: 3, //thickness of dash/dots
                                  dashPattern: const [10, 6],
                                  radius: const Radius.circular(12),

                                  child: Container(
                                    height: 100,
                                    width: 250,
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.cloud_upload_rounded,
                                          color: Colors.grey,
                                          size: 50,
                                        ),
                                        Text(
                                          "Add Image",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              kVSpace16,
                              const Row(
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                  kHSpace8,
                                  Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // kVSpace8,
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: textCustom(titel: "Location")),
                      kVSpace8,
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 220,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kcolorsgerrn,
                                ),
                                onPressed: () {
                                  getCurrentLocation().then((value) async {
                                    lat = "${value.latitude}";
                                    long = "${value.longitude}";

                                    setState(() {
                                      locationMessage =
                                          "https://www.google.com/maps/search/?api=1&query=$lat,$long";
                                    });
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text(
                                              'Gitting current location...')));
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Update location",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            kVSpace8,
                            InkWell(
                              onTap: () =>
                                  launchUrl(Uri.parse(locationMessage)),
                              child: Text(
                                locationMessage,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                      kVSpace8,
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: textCustom(titel: "Delete Station")),
                      kVSpace8,
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElecatedButtonDeleteStation(
                          id: widget.id,
                        ),
                      ),
                      kVSpace32,
                      updateButton(
                        locationgvalue: locationMessage,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
