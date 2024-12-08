import 'package:flutter/material.dart';

class Copyrights extends StatefulWidget {
  const Copyrights({super.key});

  @override
  State<Copyrights> createState() => _CopyrightsState();
}

class _CopyrightsState extends State<Copyrights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Copyrights"),
        
      ),
    );
  }
}