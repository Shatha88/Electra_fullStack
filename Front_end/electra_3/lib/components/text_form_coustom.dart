import 'package:electra/constents/colors_theme.dart';
import 'package:flutter/material.dart';

class TextFormCoustom extends StatefulWidget {
  const TextFormCoustom(
      {super.key,
      required this.hint,
      required this.label,
      this.icon,
      this.isPassword = false,
      this.controller,
      this.onchanged,
      this.onSaved,
      this.obscureText = false,
      this.maxLines = 1,
      this.validator,
      this.minLines,
      this.cursorColor});

  final String hint;
  final String label;
  final IconData? icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final Function(String)? onchanged;
  final Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final Color? cursorColor;

  @override
  State<TextFormCoustom> createState() => _TextFormCoustomState();
}

class _TextFormCoustomState extends State<TextFormCoustom> {
  var obscureText = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          child: TextField(
            // validator: widget.validator,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            enabled: true,
            controller: widget.controller,
            obscureText: obscureText,
            obscuringCharacter: "*",
            cursorColor: Colors.black,
            decoration: InputDecoration(
                fillColor: txtFieldBGColor,
                filled: true,
                hintText: widget.hint,
                labelText: widget.label,
                prefixIcon: Icon(
                  widget.icon,
                  color: buttonBGColor,
                ),
                suffixIcon: widget.isPassword!
                    ? IconButton(
                        color: buttonBGColor,
                        icon: Icon(obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(
                            () {
                              obscureText = !obscureText;
                            },
                          );
                        },
                      )
                    : null,
                labelStyle: const TextStyle(
                    color: buttonBGColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: buttonBGColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: buttonBGColor))),
          ),
        ));
  }
}
