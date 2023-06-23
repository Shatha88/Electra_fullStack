// ignore_for_file: camel_case_types

import 'package:electra/components/Provider/Componints/AddStationComponints/textFeldCustom.dart';
import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:flutter/material.dart';

import '../../constents/spaces.dart';

class verifyEmail extends StatefulWidget {
  const verifyEmail({super.key});

  @override
  State<verifyEmail> createState() => _verifyEmailState();
}

class _verifyEmailState extends State<verifyEmail> {
  @override
  Widget build(BuildContext context) {
    var screenVeify = MediaQuery.of(context).size.height;
    // var screenA = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: screenVeify,
          child: Column(children: <Widget>[
            Column(children: [
              const Image(
                  image: AssetImage("assets/images/aaa-removebg-preview.png"),
                  fit: BoxFit.fitWidth,
                  width: double.infinity),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Verify Email",
                          style: TextStyle(
                              color: txtFieldColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    kVSpace16,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: TextCustom(
                        text: "Enter your email",
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    kVSpace8,
                    const textfeldecustom(
                        titel: "Email", iconData: Icons.email),
                    kVSpace16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 170,
                          child: TextField(
                            enabled: true,
                            cursorColor: const Color.fromARGB(255, 74, 74, 74),
                            cursorWidth: 2,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "***",
                              border: const OutlineInputBorder(),
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 170,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: buttonBGColor,
                              ),
                              onPressed: () {},
                              child: const TextCustom(
                                text: "Get Code",
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                    kVSpace16,
                    SizedBox(
                      height: 50,
                      width: 380,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonBGColor,
                          ),
                          onPressed: () {},
                          child: const TextCustom(
                            text: "Verify",
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              )
            ]),
          ]),
        ),
      ),
    );
  }
}
