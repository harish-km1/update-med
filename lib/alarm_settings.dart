import 'package:flutter/material.dart';

class AlarmSettings extends StatefulWidget {
  @override
  _AlarmSettingsState createState() => _AlarmSettingsState();
}

class _AlarmSettingsState extends State<AlarmSettings> {
  String selectedTune = 'Rooster';
  String selectedStrength = 'Medium';
  String selectedSnooze = '10mins';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alarm settings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: selectedTune,
          decoration: InputDecoration(
            labelText: "Alarm tune",
            border: OutlineInputBorder(),
          ),
          items: ['Chimes', 'Rooster', 'Sweet piano']
              .map((tune) => DropdownMenuItem(
                    value: tune,
                    child: Text(tune),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedTune = value!;
            });
          },
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: selectedStrength,
          decoration: InputDecoration(
            labelText: "Alarm strength",
            border: OutlineInputBorder(),
          ),
          items: ['Low', 'Medium', 'Louder']
              .map((strength) => DropdownMenuItem(
                    value: strength,
                    child: Text(strength),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedStrength = value!;
            });
          },
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: selectedSnooze,
          decoration: InputDecoration(
            labelText: "Snooze",
            border: OutlineInputBorder(),
          ),
          items: ['5mins', '10mins', '15mins']
              .map((snooze) => DropdownMenuItem(
                    value: snooze,
                    child: Text(snooze),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedSnooze = value!;
            });
          },
        ),
      ],
    );
  }
}
