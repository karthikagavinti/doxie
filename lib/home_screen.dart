import 'package:flutter/material.dart';
import 'package:doxie/drawer.dart';
import 'package:doxie/screens/edit_page.dart';
import 'package:doxie/screens/middle_page.dart';
import 'package:doxie/screens/next_page.dart';
import 'dart:ui' as ui;
//import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              // color: Color.fromRGBO(227, 59, 12, 1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF5F7FA),
                    Color(0xFFF5F7FA),
                  ],
                  begin: Alignment.centerLeft,
                  tileMode: TileMode.mirror,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Image.asset(
            'lib/assets/Doxie_logo.png',
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
        ),
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white, Colors.white],
            ).createShader(bounds);
          },
          child:      Text(
              'DOXIE',
              style: TextStyle(
                color: Color(0xFF0E0C0D),
                fontSize: 30,
                letterSpacing: 4,
                fontFamily: 'SFUIDisplay',  // Specify your custom font family here
              ),
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Builder(
              builder: (context) {
                return IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, _createRoute(CustomDrawer()));
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xFF0E0C0D),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: <Widget>[
              EditPage(),
              MiddlePage(),
              NextPage(),
            ],
          ),
          Positioned(
            right: 8,
            top: MediaQuery.of(context).size.height / 3,
            child: CustomScrollBar(controller: _pageController),
          ),
        ],
      ),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide in from right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

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

class CustomScrollBar extends StatelessWidget {
  final PageController controller;

  const CustomScrollBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      thumbVisibility: true,
      thickness: 8,
      radius: const Radius.circular(4),
      child: Container(),
    );
  }
}
