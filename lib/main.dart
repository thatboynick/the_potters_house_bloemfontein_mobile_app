import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/welcome_screen.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/widgets/nav_bar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route
      getPages: [
        GetPage(name: '/', page: () => const SplashView()), // Define the splash view
        GetPage(name: '/navBar', page: () => const NavBar()), // Define the nav bar view
        // Add more routes here as needed
      ],
    );
  }
}