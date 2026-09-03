import 'package:hw_6/screens/home_screen.dart';
import 'package:hw_6/service/api.dart';
import 'package:flutter/material.dart';

void main() {
  Api().getData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}