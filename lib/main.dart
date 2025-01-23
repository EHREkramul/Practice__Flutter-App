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
    TextEditingController _textController = TextEditingController();
    TextEditingController _numberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
      body:
      /*ListView.builder(
        itemCount: myItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(myItems[index]['img']!),
            title: Text(myItems[index]['title']!),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        },
      ),*/
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 40),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Enter Text",
                hintStyle: TextStyle(fontSize: 15, color: Colors.red),
                labelText: "Text",
                labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
                helperText: "Enter Text Value",
                prefixIcon: Icon(Icons.usb),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 45),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(14)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 40),
            child: TextField(
              controller: _numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter Your Number",
                hintStyle: TextStyle(fontSize: 15, color: Colors.red),
                labelText: "Number",
                labelStyle: TextStyle(fontSize: 15, color: Colors.blue),
                helperText: "Enter Number",
                helperStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(Icons.usb),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(_textController.text.length < 6){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weak Password')));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Strong Password')));
              }
              print(_numberController.text);
              print(_textController.text);
            },
            style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            child: Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () {
              _numberController.clear();
              _textController.clear();
            },
            style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            child: Text('Clear'),
          ),
          Text('data-1'),
          SizedBox(height: 5, width: 5,child: Container(color: Colors.red,),),
          Divider(color: Colors.red),
          Text('data-2'),
          Divider(color: Colors.red),
          ListTile(
            title: Text('List Title'),
            subtitle: Text('List sub title'),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data')));
            },
            onLongPress: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('long press')));
            },
          ),
          Divider(color: Colors.red),
          SizedBox(
            height: 20,
            width: double.infinity,
            child: Text('data'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: myItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Image.network(myItems[index]['img']!),
                    title: Text(myItems[index]['title']!),
                  ),
                );
              },
            ),
          ),
          Text('dsafasdf'),
          Text('dsafasdf'),
          Text('dsafasdf'),
          Text('dsafasdf'),
          Text('dsafasdf'),
        ],
      ),
    );
  }
}
