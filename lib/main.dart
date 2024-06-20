import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/screens/home_screen.dart';
import 'package:flutter_shoppingcart/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: const HomeScreen(),
    );
  }
}
