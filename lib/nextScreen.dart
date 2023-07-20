import 'package:flutter/material.dart';

class nextSreen extends StatefulWidget {

  @override
  State<nextSreen> createState() => _nextScreen();
}

class _nextScreen extends State<nextSreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Home Screen'),
        ),
      );
    }
  }

