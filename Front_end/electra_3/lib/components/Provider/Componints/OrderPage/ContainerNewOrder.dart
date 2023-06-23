// ignore_for_file: file_names

import 'package:electra/components/Provider/Componints/OrderPage/AccseprOrReject.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:electra/constents/spaces.dart';
import 'package:flutter/material.dart';

class ContainerNewOrder extends StatelessWidget {
  const ContainerNewOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: kcolorsgerrn,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order from username",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Status :  waiting",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kcolorsgrey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "time : from 1 to 3",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                klHSpace32,
                Column(
                  children: [
                    AccseprOrReject(
                      titel: "Accept",
                      color: Colors.teal.shade800,
                    ),
                    kVSpace16,
                    // kHSpace8,
                    AccseprOrReject(
                      titel: "Reject",
                      color: Colors.redAccent.shade700,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
