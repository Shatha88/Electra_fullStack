import 'package:electra/Screens/routing_screen.dart';
import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ConsumerProfile extends StatefulWidget {
  const ConsumerProfile({super.key});

  @override
  State<ConsumerProfile> createState() => _ConsumerProfileState();
}

class _ConsumerProfileState extends State<ConsumerProfile> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: txtFieldBGColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  // chat.imageUrl ??
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                ),
              ),
              const TextCustom(text: 'Customer Name'),
              const TextCustom(text: 'Customer Email'),
              const Divider(),
              // Name
              InkWell(
                onTap: () => false,
                child:  Card(
                  color: txtFieldBGColor,
                  elevation: 0,
                  child: SizedBox(
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(text: 'Name'),
                          Icon(Icons.arrow_forward_ios_outlined, size: 15)
                        ]),
                  ),
                ),
              ),
              const Divider(),
              // Wallet
              InkWell(
                onTap: () => false,
                child:  Card(
                  color: txtFieldBGColor,
                  elevation: 0,
                  child: SizedBox(
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(text: 'Wallet'),
                          Icon(Icons.arrow_forward_ios_outlined, size: 15)
                        ]),
                  ),
                ),
              ),
               Divider(),
              // Email
              InkWell(
                onTap: () => false,
                child:  Card(
                  color: txtFieldBGColor,
                  elevation: 0,
                  child: SizedBox(
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(text: 'Email'),
                          Icon(Icons.arrow_forward_ios_outlined, size: 15)
                        ]),
                  ),
                ),
              ),
              const Divider(),
              // Phone
              InkWell(
                onTap: () => false,
                child:  Card(
                  color: txtFieldBGColor,
                  elevation: 0,
                  child: SizedBox(
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(text: 'Phone'),
                          Icon(Icons.arrow_forward_ios_outlined, size: 15)
                        ]),
                  ),
                ),
              ),

              const Divider(),
              // password
              InkWell(
                onTap: () => false,
                child:  Card(
                  color: txtFieldBGColor,
                  elevation: 0,
                  child: SizedBox(
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(text: 'Password'),
                          Icon(Icons.arrow_forward_ios_outlined, size: 15)
                        ]),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBGColor, // Background color
                    ),
                    onPressed: () {
                      box.erase();
                      // context.pushAndRemoveCup(view: const RoutingScreen());
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                              CupertinoModalPopupRoute(
                                  builder: (context) => const RoutingScreen()),
                              (route) => false);
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.logout,
                          size: 30,
                        ),
                        TextCustom(
                          text: "Logout",
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}

// import 'package:flutter/material.dart';

// class ConProfile extends StatelessWidget {
//   const ConProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }