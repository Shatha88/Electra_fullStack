import 'package:electra/components/Provider/Componints/text_custom.dart';
import 'package:electra/components/text_form_coustom.dart';
import 'package:electra/constents/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.station});
  final Map station;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final cvcController = TextEditingController();
  final expiryController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var isVisible = false;
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: txtFieldBGColor,
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: ListView(padding: const EdgeInsets.all(8.0), children: [
                const SizedBox(height: 200),
                TextFormCoustom(
                  // validator: (value) {
                  // if (value!.isEmpty) {
                  // return 'Just as it appears on the card';
                  // }
                  // },
                  hint: '',
                  label: 'Card Holder',
                  icon: Icons.person,
                  controller: nameController,
                ),
                TextFormCoustom(
                  // validator: (value) {
                  // if (value!.isEmpty) {
                  // return 'This fieldis mandatory';
                  // }
                  // },
                  hint: '',
                  icon: Icons.add_card_sharp,
                  label: 'Card Number',
                  controller: numberController,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormCoustom(
                            // validator: (value) {
                            // if (value!.isEmpty) {
                            // return 'This fieldis mandatory';
                            // }
                            // },
                            hint: '',
                            label: 'CVC',
                            icon: Icons.credit_card,
                            controller: cvcController)),
                    Expanded(
                        child: TextFormCoustom(
                      // validator: (value) {
                      // if (value!.isEmpty) {
                      // return 'This fieldis mandatory';
                      // }
                      // },
                      hint: 'MM/YY',
                      label: 'Expiry Date',
                      controller: expiryController,
                    )),
                  ],
                ),
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonBGColor),
                      onPressed: () {
                        // if (!_formKey.currentState!.validate()) {
                        //   return;
                        // }
                        // _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Payment is successful...')));

                        launchUrl(Uri.parse(widget.station['location']));
                      },
                      child: const TextCustom(
                          text: 'Pay',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                    //
                    ),
              ]))),
    );
  }
}
