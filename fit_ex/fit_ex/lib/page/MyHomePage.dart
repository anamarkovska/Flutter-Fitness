
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final User? user=Auth().currentUser;


class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("FitEx"),
        actions: <Widget>[ElevatedButton(
          onPressed: signOut,
          child: const Text('Sign Out'),
        )
        ],

      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(user?.email ?? 'User email'),
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
                        'assets/images/image.jpg', height: 200.0,
                          fit: BoxFit.fill),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/image.jpg'),
                    title: const Text('Demo Title'),
                    subtitle: const Text('This is a simple card in Flutter.'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/image.jpg'),
                    title: const Text('Demo Title'),
                    subtitle: const Text('This is a simple card in Flutter.'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/image.jpg'),
                    title: const Text('Demo Title'),
                    subtitle: const Text('This is a simple card in Flutter.'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/image.jpg'),
                    title: const Text('Demo Title'),
                    subtitle: const Text('This is a simple card in Flutter.'),
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
