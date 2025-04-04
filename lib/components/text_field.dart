import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const TextFieldCustom({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        hintText: hintText,
      ),
      obscureText: obscureText,
    );
  }
}
