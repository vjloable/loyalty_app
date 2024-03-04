import 'package:flutter/material.dart';
import 'package:loyalty_app/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Loyalty App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}