// ignore_for_file: file_names
// // ignore_for_file: file_names, camel_case_types

// import 'package:electra/Imports/imports.dart';
// import 'package:geolocator/geolocator.dart';

// class detectLocarion extends StatefulWidget {
//   const detectLocarion({
//     super.key,
//   });

//   @override
//   State<detectLocarion> createState() => _detectLocarionState();
// }

// class _detectLocarionState extends State<detectLocarion> {
//   late String lat;
//   late String long;
//   late String locationMessage;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: 180,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: kcolorsgerrn,
//         ),
//         onPressed: () {
//           getCurrentLocation().then((value) {
//             lat = "${value.latitude}";
//             long = "${value.longitude}";
//             setState(() {
//               locationMessage = lat;
//             });
//           });
//         },
//         child: const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(
//               Icons.location_on,
//               size: 25,
//               color: Colors.white,
//             ),
//             Text(
//               "detect location",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             )
//           ],
//         ),
//       ),
      
//     );
//   }

//   Future<Position> getCurrentLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error("Location services are disabled");
//     }

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error("Location permissions are denied");
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           "Location permissions are permanently denied, we cannot request permission");
//     }

//     return await Geolocator.getCurrentPosition();
//   }
// }
