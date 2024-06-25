import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doxie/home_screen.dart';
import 'package:doxie/login_page.dart';
import 'package:doxie/screens/previous.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFFD6D6),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF7C7C),
                  Color(0xFFFF7C7C),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 48, color: Colors.black),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome,',
                      style: TextStyle(
                        fontFamily: 'SFUIDisplay',
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Doxie User!',
                      style: TextStyle(
                        fontFamily: 'SFUIDisplay',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              children: [
                buildCategoryHeader('Main'),
                buildDrawerItemWithSvg(context, 'lib/assets/home', 'Home', () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushReplacement(
                      context, _createRoute(const HomeScreen()));
                }),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/search', 'Search', () {}),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/previous', 'Previous', () {
                  Navigator.push(context, _createRoute(History()));
                }),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/voice', 'Voice', () {}),
                buildCategoryHeader('Social'),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/groups', 'Invite Friends', () {}),
                buildCategoryHeader('Preferences'),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/favorite', 'Favorites', () {}),
                buildCategoryHeader('Feedback'),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/feedback', 'Feedback', () {}),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/rating', 'Rate App', () {}),
                buildCategoryHeader('About'),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/about_as', 'About Us', () {}),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/privacy', 'Privacy Policy', () {}),
                buildCategoryHeader('Legal'),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/terms', 'Terms & Conditions', () {}),
                buildCategoryHeader('Support'),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/language', 'Language', () {}),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/help', 'Help & Support', () {}),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/question', 'FAQ', () {}),
                buildCategoryHeader('Settings'),
                buildDrawerItemWithSvg(context, 'lib/assets/moon', 'Dark Mode',
                    () {
                  // Toggle Dark Mode
                }),
                buildDrawerItemWithSvg(
                    context, 'lib/assets/signout', 'Sign out', () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushReplacement(
                      context, _createRoute(const LoginPage()));
                }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: Colors.grey, // Color(0xFFFF7C7C),
            child: const Center(
              child: Text(
                'Version 3.0.5',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'SFUIDisplay',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryHeader(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'SFUIDisplay',
          color: Color(0xFF0066FF),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildDrawerItemWithSvg(
      BuildContext context, String svgPath, String title, VoidCallback onTap) {
    return ListTile(
      leading: SvgPicture.asset(svgPath, width: 28, height: 28),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'SFUIDisplay',
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0); // Slide in from left
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
