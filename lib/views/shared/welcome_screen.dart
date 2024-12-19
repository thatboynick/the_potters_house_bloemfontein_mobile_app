import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {

    // Simulating a delay for splash screen
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed('/navBar'); // Navigate to NavBar screen
    });
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Church Profile Background.png"), // Your background image
            fit: BoxFit.cover, // This will cover the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Image.asset(
                  'assets/The Potters House Bloemfontein Logo.png',
                  height: 200,
                ),
              ),

              const Text(
                'WHERE JESUS IS STILL \nCHANGING LIVES!',
                style: TextStyle(color: Color(0xffefe9ce), 
                fontWeight: FontWeight.w600, 
                fontSize: 20,
                letterSpacing: 3.0),
                textAlign: TextAlign.center,
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}