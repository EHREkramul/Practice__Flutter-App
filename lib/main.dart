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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _count = 0;
  _incrementCount() {
    setState(() {
      _count++;
    });
  }

  final TextEditingController _taskNameController = TextEditingController();

  final List<String> _taskItems = [];

  _addTask({required String taskName}) {
    if (taskName.trim().isNotEmpty) {
      setState(() {
        _taskItems.insert(0, taskName);
      });
    }
  }

  _removeTask({required int index}) {
    setState(() {
      _taskItems.removeAt(index);
    });
  }

  _clearTask() {
    setState(() {
      _taskItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _clearTask,
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(
          Icons.delete_rounded,
          size: 30,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _taskNameController,
              decoration: InputDecoration(
                label: Text('Task Name'),
                hintText: 'Enter Your Task',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _addTask(taskName: _taskNameController.text);
                    _taskNameController.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: _taskItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.task,),
                      title: Text(_taskItems[index]),
                      trailing: IconButton(
                          onPressed: () => _removeTask(index: index),
                          icon: Icon(Icons.delete_forever,color: Colors.red.shade300,)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
