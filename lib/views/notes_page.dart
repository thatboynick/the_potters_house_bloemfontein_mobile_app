import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Notes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Passive Dads"),
              subtitle: Text("King David..."),
              trailing: Text("08/12/2024"),
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add), // Icon for the button
        backgroundColor: Color(0xffb7975b), // Background color of the button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Position the button at the bottom right
    );
  }
}