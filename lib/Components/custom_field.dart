import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.obscureText,
      required this.label,
      required this.controller,
      required this.icon,
      this.width = 200});

  final bool obscureText;
  final String label;
  final TextEditingController controller;
  final Icon icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintStyle: const TextStyle(color: Colors.blue),
            hintText: label,
            prefixIcon: icon),
      ),
    );
  }
}
