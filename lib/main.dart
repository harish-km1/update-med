import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'add_medicine_info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
      routes: {
        '/add_medicine': (context) => AddMedicineInfoPage(),
      },
    );
  }
}
