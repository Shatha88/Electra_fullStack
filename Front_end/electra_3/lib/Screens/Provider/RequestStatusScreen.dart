// ignore_for_file: file_names

import 'package:electra/Screens/Provider/ProviderStationsScreen.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:electra/services/extention/navigator/navigator_ext.dart';
import 'package:flutter/material.dart';

class RequestStatus extends StatelessWidget {
  const RequestStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.push(view: const ProviderStation());
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: kcolorsyallow,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                          color: kcolorsgerrn,
                        ),
                      ),
                    ),
                    const Text(
                      "Your Request",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    klHSpace32,
                  ],
                ),
              ),
              kVSpace64,
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: kcolorsyallow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: kcolorsgerrn,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.done,
                          size: 100,
                          color: kcolorsyallow,
                        ),
                      ),
                      const Text(
                        "Successfully",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kcolorsgerrn,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "The request will be\n  answered soon....",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kcolorsgerrn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
