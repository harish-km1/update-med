import 'package:flutter/material.dart';
import 'alarm_settings.dart';
import 'datetime_field.dart';
import 'add_medicine_info_page.dart'; // Import the AddMedicineInfoPage

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device settings"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text("Set vacation time"),
              value: true,
              onChanged: (bool value) {},
              activeColor: Colors.blue,
            ),
            // Start Date & Time
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start date & time",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: DateTimeField(label: 'DD / MM / YYYY'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: DateTimeField(label: 'HH: MM'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // End Date & Time
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "End date & time",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: DateTimeField(label: 'DD / MM / YYYY'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: DateTimeField(label: 'HH: MM'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add Medicine Info button
            SizedBox(height: 20), // Add spacing before the button
            ElevatedButton(
              onPressed: () {
                // Navigate to Add Medicine Info Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMedicineInfoPage()),
                );
              },
              child: Text("Add Medicine Info"),
            ),
            SizedBox(height: 20), // Add some spacing
            SwitchListTile(
              title: Text("Show meds name"),
              value: false,
              onChanged: (bool value) {},
              activeColor: Colors.blue,
            ),
            SwitchListTile(
              title: Text("Notify pharma to autofill"),
              value: false,
              onChanged: (bool value) {},
              activeColor: Colors.blue,
            ),
            SwitchListTile(
              title: Text("Add sorry time"),
              value: false,
              onChanged: (bool value) {},
              activeColor: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Occupied cabinets: 1, 2, 3, 4, 5",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            AlarmSettings(),
          ],
        ),
      ),
    );
  }
}
