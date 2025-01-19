import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  mySnackBar(message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('First App'),
        actions: [
          IconButton(
              onPressed: () {
                mySnackBar('Appbar Search', context);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                mySnackBar('Appbar More', context);
              },
              icon: Icon(Icons.more_horiz)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mySnackBar('Floating Button', context);
        },
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: 0,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              mySnackBar('Home NavBar', context);
              break;
            case 1:
              mySnackBar('Profile NavBar', context);
              break;
            case 2:
              mySnackBar('Settings NavBar', context);
              break;
          }
        },
      ),
      drawer: SafeArea(
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text('First App'),
                  accountEmail: Text('Testing App'),
                  currentAccountPicture: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () {
                  mySnackBar('Profile Drawer', context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  mySnackBar('Settings Drawer', context);
                },
              ),
              ListTile(
                leading: Icon(Icons.security),
                title: Text('Security'),
                onTap: () {
                  mySnackBar('Security Drawer', context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_support_rounded),
                title: Text('Support'),
                onTap: () {
                  mySnackBar('Support Drawer', context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 50, width: 50, decoration: BoxDecoration(color: Colors.black)),
          Container(height: 50, width: 50, decoration: BoxDecoration(color: Colors.black)),
          Container(height: 50, width: 50, decoration: BoxDecoration(color: Colors.black)),
          Container(height: 50, width: 50, decoration: BoxDecoration(color: Colors.black)),
        ],
      ),
    );
  }
}
