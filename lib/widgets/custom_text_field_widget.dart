import 'package:flutter/material.dart';

class CustomTextFielWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool obscureText;

  const CustomTextFielWidget(
      {Key? key,
      required this.onChanged,
      required this.label,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
