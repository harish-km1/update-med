import 'package:flutter/material.dart';

class TimeDosePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Time",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Dose",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
