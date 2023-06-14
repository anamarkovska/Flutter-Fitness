import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_ex/page/categories-page.dart';
import 'package:fit_ex/page/levels-page.dart';
import 'package:fit_ex/page/profile-page.dart';
import 'package:fit_ex/widget-tree.dart';
import 'package:flutter/material.dart';
import 'package:fit_ex/page/all-exercises.dart';

import 'auth.dart';
import 'model/User.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

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
        ],
      ),
    );
  }
}