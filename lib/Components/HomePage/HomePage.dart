import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static const List<Widget> bottomNavigationTabs = [
    Text('Profile'),
    Text('Forum'),
    Text('Ratings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Concordia Oracle'))),
      body: Container(
        child: Center(child: Text('Welcome to Concordia Oracle!'))
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) => {
          setState(() => {
            _selectedIndex = index
          })
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Forum'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Ratings')
        ]
      ),
    );
  }
}

