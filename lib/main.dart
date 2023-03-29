import 'package:flutter/material.dart';
import 'package:three_d_card/screens/home.dart';


void main() {
  runApp(const ThreeDCardApp());
}

class ThreeDCardApp extends StatelessWidget {
  const ThreeDCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

 