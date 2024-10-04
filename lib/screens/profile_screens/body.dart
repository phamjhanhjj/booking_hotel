import 'package:booking_hotel/screens/profile_screens/log_out.dart';
import 'package:booking_hotel/screens/profile_screens/profile_pic.dart';
import 'package:flutter/material.dart';

import '../FeatureInProgress/featureIn_progress.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0), // Adjust this value to move ProfilePic down
          child: ProfilePic(),
        ),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: Icons.person,
          text: 'My Account',
          press: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FeatureInProgressWidget();
              },
            );
          },
        ),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: Icons.notifications,
          text: 'Notifications',
          press: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FeatureInProgressWidget();
              },
            );
          },
        ),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: Icons.settings,
          text: 'Settings',
          press: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FeatureInProgressWidget();
              },
            );
          },
        ),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: Icons.help_outline,
          text: 'Help Center',
          press: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FeatureInProgressWidget();
              },
            );
          },
        ),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: Icons.logout,
          text: 'Log Out',
          press: () {showLogOutDialog(context);},
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color.fromARGB(255, 224, 220, 220),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}