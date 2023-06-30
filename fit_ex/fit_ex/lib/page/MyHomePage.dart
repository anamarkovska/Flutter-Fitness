import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FitEx"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: signOut,
            child: const Text('Sign Out'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.grey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/image.jpg',
                        height: 200.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/image.jpg'),
                    title: const Text('Health Benefits, How to Get Started, and How to Get Better'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/image.jpg'),
                    title: const Text('What Is the DASH Diet?'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/image.jpg'),
                    title: const Text('5 Yoga Poses and Exercises for Better Sleep'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/image.jpg'),
                    title: const Text('How What You Eat Affects How You Sleep'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }
}
