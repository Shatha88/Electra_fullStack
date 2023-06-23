// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/ElevatedButtonAddStation.dart';
import 'package:electra/components/Provider/Componints/AddStationComponints/textCustom.dart';
import 'package:electra/components/Provider/Componints/EditStation/gitLocation.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class addStationContainer extends StatefulWidget {
  const addStationContainer({
    super.key,
  });

  @override
  State<addStationContainer> createState() => _addStationContainerState();
}

class _addStationContainerState extends State<addStationContainer> {
  File image = File(
      'https://media.istockphoto.com/id/1251125012/photo/close-up-of-a-charging-electric-car.jpg?s=612x612&w=0&k=20&c=FYXsskzOZlSuPneNAIghjRbDKpH00946l2jlNo4anSk=');
  late String lat;
  late String long;
  String locationMessage = "";
  String dropdownValue = 'Level-1';

  Future PickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (_) {
      // print("Failed to pick image $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: kcolorsgrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Add new station",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            kVSpace24,
            const Align(
              alignment: Alignment.bottomLeft,
              child: textCustom(
                titel: "Upload images of station : ",
              ),
            ),
            kVSpace16,
            InkWell(
              onTap: () => PickImage(),
              child: DottedBorder(
                color: Colors.grey, //color of dotted/dash line
                strokeWidth: 3, //thickness of dash/dots
                dashPattern: const [10, 6],
                radius: const Radius.circular(12),

                child: Container(
                  height: 100,
                  width: 250,
                  padding: const EdgeInsets.all(10.0),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            // ElvatedButtonImangePicker(image: image),
            kVSpace16,
            const Align(
              alignment: Alignment.bottomLeft,
              child: textCustom(
                titel: "Charging Power : ",
              ),
            ),
            kVSpace8,
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 40,
                width: 100,
                child: DropdownButton<String>(
                  value: dropdownValue,

                  items: <String>['Level-1', 'Level-2', 'Level-3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
            kVSpace16,
            // detectLocarion(),
            SizedBox(
              height: 50,
              width: 180,
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
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Gitting current location...')));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      "detect location",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // InkWell(
            //   child: Text(locationMessage),
            //   onTap: () => locationMessage,
            // ),
            kVSpace8,

            InkWell(
              onTap: () => launchUrl(Uri.parse(locationMessage)),
              child: Text(
                locationMessage,
                style: const TextStyle(
                    decoration: TextDecoration.underline, color: Colors.blue),
              ),
            ),
            kVSpace24,
            ElecatedButtonAddStation(
              locationgvalue: locationMessage,
              ratingvalue: dropdownValue,
            ),
          ],
        ),
      ),
    );
  }
}
