import 'package:flutter/material.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/add_notes_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/view_notes_page.dart';

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
        title: const Text("Notes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Passive Dads"),
              subtitle: Text("King David..."),
              trailing: Text("08/12/2024"),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewNotes(),
                ),
              );
            },
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNotes(),
                ),
              );
            },
        child: const Icon(Icons.add), // Icon for the button
        backgroundColor: const Color(0xffb7975b), // Background color of the button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Position the button at the bottom right
    );
  }
}