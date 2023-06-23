// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';

// import 'package:electra/Models/station2_model.dart';
import 'package:electra/Screens/Consumer/station_detail.dart';
import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/services/api/consumer_api.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../constents/spaces.dart';

class ConHome extends StatefulWidget {
  const ConHome({super.key});

  @override
  State<ConHome> createState() => _ConHomeState();
}

class _ConHomeState extends State<ConHome> {
  bool isLoading = true;
  List stations = [];

  @override
  void initState() {
    super.initState();
    getStation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
              Align(
                alignment: Alignment.center,
                child: Visibility(
                  visible: isLoading,
                  child: const SizedBox(
                      height: 200,
                      width: 200,
                      child: RiveAnimation.asset(
                          'assets/icons/ElectraLoader.riv')),
                ),
              ),
              kVSpace16,
              Expanded(
                child: ListView(
                  // shrinkWrap: true,
                  children: [
                    for (var itme in stations) stationCard(station: itme)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getStation() async {
    if ((await getStations()).statusCode == 200) {
      isLoading = false;
      stations = json.decode((await getStations()).body);
      stations = List.from(stations.reversed);
      log('$stations');
      setState(() {});
    }
  }
}

class stationCard extends StatelessWidget {
  const stationCard({
    super.key,
    required this.station,
  });
  final Map station;
  @override
  Widget build(BuildContext context) {
    List time = station['station_time'];
    return InkWell(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 3,
        color: iconsColor,
        shape: const OutlineInputBorder(
            borderSide: BorderSide(color: iconsColor),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox(
          height: 150,
          child: Row(children: [
            const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    width: 140,
                    image: NetworkImage(
                      'https://media.istockphoto.com/id/1251125012/photo/close-up-of-a-charging-electric-car.jpg?s=612x612&w=0&k=20&c=FYXsskzOZlSuPneNAIghjRbDKpH00946l2jlNo4anSk=',
                      // fit: BoxFit.fill,
                    ),
                    // NetworkImage(station['image_url']),
                    fit: BoxFit.fill,
                  ),
                ]),
            // kHSpace8,
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 18),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom(
                          text: 'ID: ${station['id']}',
                          fontWeight: FontWeight.bold,
                        ),
                        kHSpace64,
                        kHSpace8,
                        Row(children: [
                          Text(station['rating']),
                          const Icon(
                            Icons.battery_charging_full_outlined,
                            color: Colors.amber,
                          ),
                        ]),
                      ],
                    ),
                    kVSpace16,
                    TextCustom(
                      text: 'Price: ${station['price']}',
                      fontWeight: FontWeight.bold,
                    ),
                    kVSpace16,
                    if (time.isNotEmpty) ...[
                      TextCustom(
                        text: 'Time: ${time[0]['from']} - ${time[0]['to']}',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      )
                    ] else ...[
                      const TextCustom(
                        text: 'Not Working currently',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 3),
              child: Column(children: []),
            ),
          ]),
        ),
      ),
      onTap: () {
        context.push(
          view: StationDetailPage(station: station),
        );
      },
    );
  }
}
