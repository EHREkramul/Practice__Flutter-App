import 'package:flutter/material.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 102, 124, 137),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 102, 124, 137),
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}