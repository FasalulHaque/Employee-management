import 'package:flutter/material.dart';

class TextFelid extends StatelessWidget {
   TextFelid({
    super.key,
    required this.mediaQury,
    required this.text,
    required this.icon,
    required this.controller
  });

  final MediaQueryData mediaQury;
  final String text;
  final Icon icon;
  TextEditingController controller;

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
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey, letterSpacing: 1.3),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
