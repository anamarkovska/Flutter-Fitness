import 'package:fit_ex/page/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'page/Login-Register-Page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MyHomePage(title: 'Title',);
        } else {
          return LoginPage();
        }
      },
    );
  }
}