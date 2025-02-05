import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Employee')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text('Name'),
                hintText: 'Enter your name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text('Age'),
                hintText: 'Enter your age',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text('Salary'),
                hintText: 'Enter your salary',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add Employee'),
          )
        ],
      ),
    );
  }
}
