import 'package:flutter/material.dart';
import 'package:telkomsel_app/screens/bottom_navbar.dart';
import 'package:telkomsel_app/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: redColor, unselectedItemColor: greyColor)),
      title: 'Telkomsel App',
      home: BottomNavBar(),
    );
  }
}
