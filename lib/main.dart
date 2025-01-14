import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Pass an Application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme: ThemeData(primarySwatch: Colors.cyan),
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  // An activity
  const HomeActivity({super.key});

  // Snack bars
  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Inventory'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        toolbarHeight: 60,
        toolbarOpacity: 1.0,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                mySnackBar('Search', context);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                mySnackBar('Email', context);
              },
              icon: Icon(Icons.email)),
          IconButton(
              onPressed: () {
                mySnackBar('Settings', context);
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                mySnackBar('Account', context);
              },
              icon: Icon(Icons.account_circle)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mySnackBar('Floating Action Button', context);
        },
        elevation: 10,
        tooltip: 'Floating Button',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index) {
          if (index == 0) {
            mySnackBar("Home NavBar", context);
          } else if (index == 1) {
            mySnackBar("Contact NavBar", context);
          } else if (index == 2) {
            mySnackBar("Profile NavBar", context);
          }
        },
      ),
      drawer: Drawer(),
    );
  }
}
