import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // Variable to hold the selected value
  int? _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Notifications"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("On"),
              trailing: Radio<int>(
                value: 1, // Value for this radio button
                groupValue: _selectedValue,
                activeColor: Color(0xffb7975b), // Current selected value
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value; // Update the selected value
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Off"),
              trailing: Radio<int>(
                value: 2, // Value for this radio button
                groupValue: _selectedValue,
                activeColor: Color(0xffb7975b), // Current selected value
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value; // Update the selected value
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}