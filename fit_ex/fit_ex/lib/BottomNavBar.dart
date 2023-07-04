import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_ex/page/camera-page.dart';
import 'package:fit_ex/page/levels-page.dart';
import 'package:fit_ex/page/profile-page.dart';
import 'package:fit_ex/widget-tree.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key});

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

final User? user = Auth().currentUser;

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _children = [
    WidgetTree(),
    CategoriesScreen(),
    ProfilePage(),
    CameraScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue, // Set the selected item color
        selectedIconTheme: IconThemeData(color: Colors.blue), // Set the icon color for the selected item
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
        ],
      ),
    );
  }
}
