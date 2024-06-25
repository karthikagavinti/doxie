import 'package:flutter/material.dart';
import 'package:doxie/home_screen.dart';
import 'dart:ui' as ui;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 213, 213),
                  //Color.fromARGB(255, 173, 100, 100),
                  //  Colors.black,
                  //  Color(0xFFFF7C7C),

                  Color(0xFFFF7C7C).withOpacity(0.9),
                  Color.fromARGB(255, 65, 118, 150),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  // width: 380,
                  height: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    //color: Color(0xFFFF7C7C), // Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 30,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    children: [
                      const SizedBox(height: 200),
                      const Text(
                        'Welcome to DOXIE',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SFUIDisplay',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Experience the best of our services.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontFamily: 'SFUIDisplay',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 100),
                      // Additional Features Section
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // _buildFeatureItem(
                          //   Icons.check_circle_outline,
                          //   'Easy to Use',
                          //   'Intuitive design for seamless navigation.',
                          // ),
                          _buildFeatureItem(
                            Icons.security,
                            'Secure',
                            'Your data is safe with advanced security measures.',
                          ),
                          // _buildFeatureItem(
                          //   Icons.person_outline,
                          //   'Personalized',
                          //   'Tailored experience based on your preferences.',
                          // ),
                          // _buildFeatureItem(
                          //   Icons.update,
                          //   'Regular Updates',
                          //   'Enjoy new features and enhancements regularly.',
                          // ),
                        ],
                      ),
                      const SizedBox(height: 200),
                      // Get Started Button
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(seconds: 1),
                        builder: (context, double value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child!,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 235, 69, 58),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
