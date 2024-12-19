import 'package:flutter/material.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/copyrights_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/downloads_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/feedback_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/help_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/inbox_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/loginpopup_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/notes_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/notifications_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/privacy_policy_page.dart';
import 'package:the_potters_house_bloemfontein_mobile_app/views/profile/terms_of_use_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60, // Adjust the radius for size
                  backgroundImage: AssetImage(
                      "assets/Church Profile.png"), // Your image path
                ),
                const SizedBox(height: 10),
                const Text(
                  "PHC BLOEM",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled:
                          true, // Allows the bottom sheet to take full height
                      builder: (BuildContext context) {
                        return const LoginPopUp(); // Show the LoginPage bottom sheet
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xffb7975b), // Set the background color to black
                  ),
                  child: const Text(
                    "Log in or Sign up",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "This Device",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(
                    Icons.notifications_outlined,
                    size: 28,
                  ),
                  title: const Text("Inbox"),
                  subtitle: const Text("Access your notifications"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Inbox(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.notes_outlined,
                    size: 28,
                  ),
                  title: const Text("Notes"),
                  subtitle: const Text("Access your notes"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Notes(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.file_download_outlined,
                    size: 28,
                  ),
                  title: const Text("Downloads"),
                  subtitle: const Text("Access your downloads"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Downloads(),
                      ),
                    );
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "App Settings",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(
                    Icons.notifications_active_outlined,
                    size: 28,
                  ),
                  title: const Text("Notifications"),
                  subtitle: const Text("Manage notification preferences"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Notifications(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.notes_outlined,
                    size: 28,
                  ),
                  title: const Text("Terms of Use"),
                  subtitle: const Text("Our terms of use"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsOfUse(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.key_outlined,
                    size: 28,
                  ),
                  title: const Text("Privacy Policy"),
                  subtitle: const Text("Our privacy policy"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicy(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.copyright_outlined,
                    size: 28,
                  ),
                  title: const Text("Copyrights"),
                  subtitle: const Text("Copyright information"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Copyrights(),
                      ),
                    );
                  },
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    size: 28,
                  ),
                  title: Text("About"),
                  subtitle: Text("App version 1.0.0"),
                ),
                const Divider(),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "More",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const ListTile(
                  leading: Icon(
                    Icons.share_outlined,
                    size: 28,
                  ),
                  title: Text("Share PHC BLOEM App"),
                  subtitle: Text("Get a link to share the app"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.feedback_outlined,
                    size: 28,
                  ),
                  title: const Text("Feedback"),
                  subtitle: const Text("Provide feedback on the app"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedbackPage(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.help_outline_outlined,
                    size: 28,
                  ),
                  title: const Text("Help"),
                  subtitle: const Text("Get technical support"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Help(),
                      ),
                    );
                  },
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
