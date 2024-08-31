import 'package:flutter/material.dart';

class AddMedicineInfoPage extends StatefulWidget {
  @override
  _AddMedicineInfoPageState createState() => _AddMedicineInfoPageState();
}

class _AddMedicineInfoPageState extends State<AddMedicineInfoPage> {
  final TextEditingController _medicineNameController = TextEditingController();
  List<AlarmEntry> _alarms = [AlarmEntry()];

  Frequency _selectedFrequency = Frequency.Daily;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Medicine Info"),
        backgroundColor: Colors.teal,
        actions: [
          TextButton(
            onPressed: () {
              // Save or submit the medicine info
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Medicine Name Input
            TextField(
              controller: _medicineNameController,
              decoration: InputDecoration(
                labelText: "Medicine Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.medical_services, color: Colors.teal),
              ),
            ),
            SizedBox(height: 20),

            // Frequency Selector
            Text(
              "Frequency",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            Column(
              children: Frequency.values.map((frequency) {
                return RadioListTile<Frequency>(
                  title: Text(frequency.toString().split('.').last),
                  value: frequency,
                  groupValue: _selectedFrequency,
                  onChanged: (value) {
                    setState(() {
                      _selectedFrequency = value!;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Alarm Entries List
            Text(
              "Alarm Entries",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _alarms.length,
                itemBuilder: (context, index) {
                  return _buildAlarmEntry(_alarms[index], index);
                },
              ),
            ),

            // Add More Alarms Button
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _alarms.add(AlarmEntry());
                  });
                },
                icon: Icon(Icons.add_alarm),
                label: Text("Add Alarm"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlarmEntry(AlarmEntry alarm, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alarm ${index + 1}",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Time (HH:MM)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {
                      alarm.time = value;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Dose (ml)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      alarm.dose = value;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmEntry {
  String time;
  String dose;

  AlarmEntry({this.time = '', this.dose = ''});
}

enum Frequency { Daily, SpecificDays, Interval, AsNeeded }
