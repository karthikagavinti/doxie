import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // Future<void> _handleGoogleSignIn() async {
  //   try {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     await googleSignIn.signIn();
  //   } catch (error) {
  //     print('Google sign in failed: $error');
  //   }
  // }

  // Future<void> _handleAppleSignIn() async {
  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     print('Apple sign in successful: $credential');
  //   } catch (error) {
  //     print('Apple sign in failed: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 213, 213),
                  Color.fromARGB(255, 173, 100, 100),
                  
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please login to your account',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    _buildTextField(Icons.email, 'Email', false),
                    const SizedBox(height: 20),
                    _buildTextField(Icons.lock, 'Password', true),
                    const SizedBox(height: 30),
                    _buildFooter(context),
                    const SizedBox(height: 50),
                    _buildLoginButton(context),
                    const SizedBox(height: 20),
                    _buildSocialLoginButtons(context),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, bool obscureText) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: child!,
        );
      },
      child: ElevatedButton(
        onPressed: () {
          // Add your login logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 248, 74, 62),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          // onPressed: _handleGoogleSignIn,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          icon: Image.asset(
            'lib/assets/google.png', // Ensure you have a google logo asset
            height: 24,
            width: 24,
          ),
          label: const Text(
            'Continue with Google',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {},
          // onPressed: _handleAppleSignIn,
          style: ElevatedButton.styleFrom(
            overlayColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          icon: Icon(
            Icons.apple,
            size: 36,
            color: Colors.white,
          ),
          label: const Text(
            'Continue with Apple',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to forgot password screen
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              // decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            // Navigate to sign up screen
          },
          child: const Text(
            "Don't have an account? Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              // decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
