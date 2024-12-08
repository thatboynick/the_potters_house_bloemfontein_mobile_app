import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Search",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600), // Adjust text style as needed
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    cursorColor: Colors.green.shade700,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: "Search media...",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Browse by",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.message_outlined,
                      size: 28,
                      color: Colors.grey,
                    ),
                    title: Text("Topic"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.mic_external_on_outlined,
                      size: 28,
                      color: Colors.grey,
                    ),
                    title: Text("Speaker"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.book_outlined,
                      size: 28,
                      color: Colors.grey,
                    ),
                    title: Text("Scripture"),
                  ),
                  Divider(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
