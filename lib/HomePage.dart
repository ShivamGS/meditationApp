// ignore_for_file: file_names

import 'package:dhyann/home.dart';
import 'package:dhyann/profilepage.dart';
import 'package:flutter/material.dart';
import 'meditationpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;
  var screens = [
    meditationpage(),
    home(),
    Profile_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            return;
          } else {
            setState(() => currentIndex = index);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Meditate',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
