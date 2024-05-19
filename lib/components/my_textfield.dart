import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/settings.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 12.0,
              fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,)),
      ),
    );
  }
}