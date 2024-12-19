import 'package:flutter/material.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/bible/bible_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/home/home_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/location/location_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/profile_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/shared/search_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Dashboard(),
      const Bible(),
      const Location(),
      const Profile(),
    ];
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20, // Adjust the radius for size
              backgroundImage:
                  AssetImage("assets/Church Profile.png"), // Your image path
            ),
            SizedBox(width: 8), // Space between image and title
            Text(
              "PHC BLOEM",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600), // Adjust text style as needed
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Search(),
                ),
              );
            },
          ),
        ],
      ),

      // Body Page View
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: screens,
      ),

      // Bottom Navigation Bar with Box Shadow
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                  0.1), // Adjust the color and opacity for subtlety
              offset: Offset(0, -2), // Shadow will be above the bar
              blurRadius: 4.0, // Adjust the blur radius
            ),
          ],
        ),
        child: NavigationBar(
          backgroundColor: Colors.white, // Set the background color to white
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          indicatorColor: Color(0xffb7975b),
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.book),
              icon: Icon(Icons.book_outlined),
              label: 'Bible',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.location_on),
              icon: Icon(Icons.location_on_outlined),
              label: 'Location',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person_2),
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
