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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.grey[200],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: Image.asset(
                          'assets/images/strong-woman.webp',
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.asset('assets/images/download.jpg'),
                        title: Text(
                          'Health Benefits, How to Get Started, and How to Get Better',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.asset('assets/images/one-more.webp'),
                        title: Text(
                          'What Is the DASH Diet?',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.asset('assets/images/joga.jpg'),
                        title: Text(
                          '5 Yoga Poses and Exercises for Better Sleep',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.asset('assets/images/man.jpeg'),
                        title: Text(
                          'How What You Eat Affects How You Sleep',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
