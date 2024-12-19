import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const TextField(
          decoration: InputDecoration(
            hintText: "Title",
            hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            border: InputBorder.none, // Remove the outline
          ),
        ),
        actions: [
          GestureDetector(
            child: const Text(
              "Save",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),
          PopupMenuButton<String>(
            color: Colors.grey.shade100,
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'Share') {
              } else if (value == 'Delete') {
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Share',
                  child: Text('Share'),
                ),
                const PopupMenuItem<String>(
                  value: 'Delete',
                  child: Text('Delete'),
                ),
              ];
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Body",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none, // Remove the outline
                ),
                maxLines: null, // Allow the text field to expand
              ),
            ],
          ),
        ),
      ),
    );
  }
}