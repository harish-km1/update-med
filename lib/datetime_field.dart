import 'package:flutter/material.dart';

class DateTimeField extends StatelessWidget {
  final String label;
  const DateTimeField({required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
