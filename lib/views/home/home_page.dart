import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  // Background Image
                  Container(
                    width: double.infinity, // Fill the width
                    height: 200, // Set the height
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/Church Profile Background.png"), // Your background image path
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                    ),
                  ),
                  // Overlay Image centered
                  Center(
                    child: Image.asset(
                      "assets/WELCOME TO THE POTTERS HOUSE BLOEMFONTEIN.png", // Your overlay image path
                      width: 280, // Set the width of the overlay image
                    ),
                  ),
                ],
              ),

              Container(
                width: double.infinity, // Fill the width
                height: 200, // Set the height
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(5), // Set the border radius
                  image: DecorationImage(
                    image: AssetImage("assets/About Us.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      offset:
                          Offset(0, 2), // Shadow offset (horizontal, vertical)
                      blurRadius: 10, // Shadow blur radius
                      spreadRadius: 1, // Shadow spread radius
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5), // Ensure the child is clipped to the border radius
                  child: Stack(
                    children: [
                      // The background image is already set in the BoxDecoration
                      // Add a semi-transparent overlay
                      Container(
                        color: Colors.black.withOpacity(0.5), // Black overlay with 50% opacity
                      ),
                      Center(
                        child: Text(
                          "About Us",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: double.infinity, // Fill the width
                height: 200, // Set the height
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(5), // Set the border radius
                  image: DecorationImage(
                    image: AssetImage("assets/Events.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      offset:
                          Offset(0, 2), // Shadow offset (horizontal, vertical)
                      blurRadius: 10, // Shadow blur radius
                      spreadRadius: 1, // Shadow spread radius
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5), // Ensure the child is clipped to the border radius
                  child: Stack(
                    children: [
                      // The background image is already set in the BoxDecoration
                      // Add a semi-transparent overlay
                      Container(
                        color: Colors.black.withOpacity(0.5), // Black overlay with 50% opacity
                      ),
                      Center(
                        child: Text(
                          "Events",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: double.infinity, // Fill the width
                height: 200, // Set the height
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(5), // Set the border radius
                  image: DecorationImage(
                    image: AssetImage("assets/Ministries.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      offset:
                          Offset(0, 2), // Shadow offset (horizontal, vertical)
                      blurRadius: 10, // Shadow blur radius
                      spreadRadius: 1, // Shadow spread radius
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5), // Ensure the child is clipped to the border radius
                  child: Stack(
                    children: [
                      // The background image is already set in the BoxDecoration
                      // Add a semi-transparent overlay
                      Container(
                        color: Colors.black.withOpacity(0.5), // Black overlay with 50% opacity
                      ),
                      Center(
                        child: Text(
                          "Ministries",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: double.infinity, // Fill the width
                height: 200, // Set the height
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(5), // Set the border radius
                  image: DecorationImage(
                    image: AssetImage("assets/Giving.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      offset:
                          Offset(0, 2), // Shadow offset (horizontal, vertical)
                      blurRadius: 10, // Shadow blur radius
                      spreadRadius: 1, // Shadow spread radius
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5), // Ensure the child is clipped to the border radius
                  child: Stack(
                    children: [
                      // The background image is already set in the BoxDecoration
                      // Add a semi-transparent overlay
                      Container(
                        color: Colors.black.withOpacity(0.5), // Black overlay with 50% opacity
                      ),
                      Center(
                        child: Text(
                          "Giving",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
