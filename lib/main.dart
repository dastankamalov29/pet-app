import 'package:flutter/material.dart';
import 'pages/onboard.dart';









void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pet App",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const PetsOnBoardiingScreen(),
    );
  }
}