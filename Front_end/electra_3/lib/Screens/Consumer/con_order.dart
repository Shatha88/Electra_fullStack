import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsumerOrder extends StatefulWidget {
  const ConsumerOrder({super.key});

  @override
  State<ConsumerOrder> createState() => _ConsumerOrderState();
}

class _ConsumerOrderState extends State<ConsumerOrder> {
  @override
  Widget build(BuildContext context) {
    // final station = ModalRoute.of(context)!.settings.arguments as Station;
    return Scaffold(
        body: SafeArea(
      child: ListView(children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextCustom(
            text: 'Orders',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        )),
        SizedBox(
          height: 160,
          child: Card(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.all(8.0),
            elevation: 5,
            color: iconsColor,
            shape: const OutlineInputBorder(
                borderSide: BorderSide(color: iconsColor),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(children: [
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: 'Station ID: 2',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    TextCustom(
                      text: 'price: 200',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    TextCustom(
                      text: 'status: confirmed',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    // Image(
                    //   height: 150,
                    //   image: NetworkImage(
                    //       'https://pcutspwauwjlfsgpunwg.supabase.co/storage/v1/object/public/Image_stations/images/b57a6b5f-913f-44fe-9e39-52d5e3e6a154.png'),
                    //   fit: BoxFit.contain,
                    // ),
                  ],
                ),
              )),
              kHSpace8,
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // TextCustom(
                                // text: 'Id${station.id!}',
                                // ),
                                // TextCustom(
                                //   text: station.distance!,
                                // ),
                                // TextCustom(
                                // text: 'location${station.location!}',
                                // ),
                              ]),
                        ],
                      ),
                      // TextCustom(
                      //   text: station.orderState!,
                      // ),
                    ],
                  )),
              kHSpace16,
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=24.8640257,46.7174922'));
                          },
                          icon: const Icon(Icons.location_on)),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.of(context).pushNamed('/payment');
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //       backgroundColor: buttonBGColor),
                      //   child: const TextCustom(
                      //     text: 'Pay',
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  )),
            ]),
          ),
        )
      ]),
    ));
  }
}
