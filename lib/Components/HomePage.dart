import 'package:concordia_oracle/Components/Profile.dart';
import 'package:concordia_oracle/Components/Ratings.dart';
import 'package:concordia_oracle/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static const List<Widget> bottomNavigationTabs = [
    Profile(),
    Text('Forum'),
    Ratings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: bottomNavigationTabs[_selectedIndex])
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: LIGHT_GREY,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
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

