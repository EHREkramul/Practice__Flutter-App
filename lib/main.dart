import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  mySnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),duration: Duration(milliseconds: 500),),
    );
  }
  @override
  Widget build(BuildContext context) {

    var myItems = [
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Rabbil"
      },
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Rupom"
      },
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Hasan"
      },
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Salif"
      },
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Alhasan"
      },
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Nurza"
      },
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Nihan"
      },
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Nuri"
      },
      {
        "img": "https://i.ytimg.com/vi/HADyEFViNxg/maxresdefault.jpg",
        "title": "Sumaiya"
      }
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: myItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              mySnackBar('Card ${myItems[index]['title']}', context);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: Image.network(
                myItems[index]['img']!,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
