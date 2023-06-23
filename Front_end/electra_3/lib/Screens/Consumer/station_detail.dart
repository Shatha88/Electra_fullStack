// import 'dart:developer';

// ignore_for_file: prefer_interpolation_to_compose_strings

// import 'package:electra/Models/station2_model.dart';
// import 'package:electra/Models/station_model.dart';
// import 'package:electra/Screens/Consumer/con_order.dart';
import 'package:electra/Screens/Consumer/payment_screen.dart';
import 'package:electra/components/Provider/Componints/text_custom.dart';

import 'package:electra/constents/colors_theme.dart';
// import 'package:electra/constents/rating.dart';
import 'package:electra/constents/spaces.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

class StationDetailPage extends StatefulWidget {
  const StationDetailPage({super.key, required this.station});

  final Map station;

  @override
  State<StationDetailPage> createState() => _StationDetailPageState();
}

class _StationDetailPageState extends State<StationDetailPage> {
  @override
  Widget build(BuildContext context) {
    // final station = ModalRoute.of(context)!.settings.arguments;

    final Map station = widget.station;
    List time = station['station_time'];
    return Scaffold(
      backgroundColor: kcolorsgrey,
      body: SafeArea(
        child: ListView(children: [
          Stack(children: [
            Image.network(
              station['image_url'],
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              // padding: EdgeInsets.only(top: 100),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 190,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: kcolorsgrey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(children: [
                        const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: TextCustom(
                              text: 'Electric Vehicle Charging Station',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustom(
                                  text: 'ID: ${widget.station['id']}',
                                  // + station['id'].toString(),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                kVSpace16,
                                if (time.isNotEmpty) ...[
                                  TextCustom(
                                    text:
                                        '${'Time: from ' + time[0]['from']} to ' +
                                            time[0]['to'],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                                ] else ...[
                                  const TextCustom(
                                    text: 'Not Working currently',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                                ],
                                kVSpace16,
                                TextCustom(
                                  text: 'Price:' + station['price'],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                kVSpace16,
                                TextCustom(
                                  text: 'Station Power:' + station['rating'],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ],
                            )),
                        kVSpace64,
                        kVSpace24,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonBGColor),
                              onPressed: () {},
                              child: const TextCustom(
                                text: 'Add To Favorite',
                                color: Colors.white,
                              ),
                            ),
                            kHSpace16,
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonBGColor),
                                onPressed: () {
                                  setState(() {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.9,
                                            child: Column(
                                              children: time
                                                  .map((element) =>
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      buttonBGColor),
                                                          onPressed: () {
                                                            context.push(
                                                                view: PaymentPage(
                                                                    station:
                                                                        station));
                                                          },
                                                          child: Text(
                                                              "${element["from"]} - ${element["to"]}")))
                                                  .toList(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  });
                                },
                                child: const TextCustom(
                                    text: 'Booking', color: Colors.white)),
                          ],
                        ),
                      ]),
                    ),
                  ]),
            ),
          ]),
        ]),
      ),
    );
  }
}
