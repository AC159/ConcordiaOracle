import 'package:concordia_oracle/Components/Profile.dart';
import 'package:concordia_oracle/Components/Ratings.dart';
import 'package:concordia_oracle/Providers/Authentication/Login/Login.dart';
import 'package:concordia_oracle/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    var currentUser = Provider.of<AuthenticationProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: Text("Concordia Oracle"), backgroundColor: ALMOST_BLACK),
      drawer: Drawer(
          backgroundColor: ALMOST_BLACK,
          child: ListView(
              children: [
                const DrawerHeader(
                    child: Image(image: AssetImage("assets/images/concordia-oracle-logo-light.png"))
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Theme.of(context).primaryColor, size: 30),
                  title: const Text('Profile', style: TextStyle(color: Colors.white, fontSize: 18)),
                  onTap: () {
                    setState(() {
                        _selectedIndex = 0;
                    });
                    Navigator.pop(context);
                  }
                ),
                ListTile(
                    leading: Icon(Icons.message, color: Theme.of(context).primaryColor, size: 30),
                    title: const Text('Forum', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                    leading: Icon(Icons.star, color: Theme.of(context).primaryColor, size: 30),
                    title: const Text('Ratings', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                    title: const Text('Logout', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onTap: () {
                      currentUser.signOutGoogle();
                      Navigator.of(context).popAndPushNamed('/');
                    }
                )
              ]
          )
      ),
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

