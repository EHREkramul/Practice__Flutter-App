import 'package:flutter/material.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Ap[',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}