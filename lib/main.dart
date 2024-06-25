import 'package:doxie/screens/welcome.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Color(0xFFFFFFFF),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontFamily: 'SFUIDisplay'),
    bodyMedium: TextStyle(fontFamily: 'SFUIDisplay'),
    bodySmall: TextStyle(fontFamily: 'SFUIDisplay'),
    displayLarge: TextStyle(fontFamily: 'SFUIDisplay'),
    displayMedium: TextStyle(fontFamily: 'SFUIDisplay'),
    displaySmall: TextStyle(fontFamily: 'SFUIDisplay'),
    headlineLarge: TextStyle(fontFamily: 'SFUIDisplay'),
    headlineMedium: TextStyle(fontFamily: 'SFUIDisplay'),
    headlineSmall: TextStyle(fontFamily: 'SFUIDisplay'),
    titleLarge: TextStyle(fontFamily: 'SFUIDisplay'),
    titleMedium: TextStyle(fontFamily: 'SFUIDisplay'),
    titleSmall: TextStyle(fontFamily: 'SFUIDisplay'),
    labelLarge: TextStyle(fontFamily: 'SFUIDisplay'),
    labelMedium: TextStyle(fontFamily: 'SFUIDisplay'),
    labelSmall: TextStyle(fontFamily: 'SFUIDisplay'),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const WelcomeScreen(),
    );
  }
}
