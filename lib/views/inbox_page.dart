import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Inbox"),
        
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  radius: 20, // Adjust the radius for size
                  backgroundImage: AssetImage(
                      "assets/Church Profile.png"), // Your image path
                ),
              title: Text("General", style: TextStyle(
                color: Colors.grey.shade600
              ),),
              subtitle: Text("Sunday Service", style: TextStyle(
                fontSize: 18,
              ),),
              trailing: Text("07 Dec", style: TextStyle(
                color: Colors.grey.shade600
              ),),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}