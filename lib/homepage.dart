import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final List<Map<String, String>> _contactList = [];

  _addContact(context) {
    if (_nameController.text.isNotEmpty && _numberController.text.isNotEmpty) {
      if (_numberController.text.length == 11) {
        setState(() {
          Map<String, String> newContact = {
            'name': _nameController.text,
            'phone': _numberController.text,
          };

          _contactList.insert(0, newContact);

          _nameController.clear();
          _numberController.clear();
        });
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              title: Text(
                'Invalid Number',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(_numberController.text.length > 11?'Entered Number is more than 11 Digit':'Entered Number is Less than 11 Digit'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Text(
                    'Close',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  _deleteContact(index) {
    if (index >= 0) {
      setState(() {
        _contactList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Column(
        spacing: 5,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                  hintText: 'Enter Contact Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: _numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Number'),
                  hintText: 'Enter 11 Digit Number'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              onPressed: () => _addContact(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 102, 124, 137),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text('Add'),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: _contactList.length,
              itemBuilder: (context, index) {
                Map<String, String> contact = _contactList.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      ListTile(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                title: Text(
                                  'Confirmation',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text('Are you sure for Delete?'),
                                actions: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.no_sim_outlined,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _deleteContact(index);
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        leading: Icon(Icons.person),
                        title: Text(
                          contact['name']!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        subtitle: Text(contact['phone']!),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: Colors.lightBlue,
                            )),
                        tileColor: Colors.grey.shade300,
                      ),
                      Divider(
                        height: 8,
                        thickness: 1.5,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
