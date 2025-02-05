import 'package:flutter/material.dart';

import 'homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Employee',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}