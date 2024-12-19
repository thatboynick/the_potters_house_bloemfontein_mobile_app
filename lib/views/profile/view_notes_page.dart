import 'package:flutter/material.dart';

class ViewNotes extends StatefulWidget {
  const ViewNotes({super.key});

  @override
  State<ViewNotes> createState() => _ViewNotesState();
}

class _ViewNotesState extends State<ViewNotes> {
  
  final TextEditingController _titleController = TextEditingController(text: "Passive Dads");
  final TextEditingController _bodyController = TextEditingController(text: "King David was a passive dad towrds his sons.");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: TextField(
          controller: _titleController, // Set the controller
          decoration: const InputDecoration(
            hintText: "Title",
            hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            border: InputBorder.none, // Remove the outline
          ),
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onTap: () {
            },
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              TextField(
                controller: _bodyController,
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
