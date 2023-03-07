import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  const textfield({
    super.key,
    required this.mediaQury,
    required this.text,
    required this.icon,
    required this.controller,
  });

  final MediaQueryData mediaQury;
  final String text;
  final Icon icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: mediaQury.size.height * 0.01,
          left: mediaQury.size.width * 0.10,
          right: mediaQury.size.width * 0.10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey, letterSpacing: 1.3),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: icon,
            prefixIconColor: Colors.black),
      ),
    );
  }
}
