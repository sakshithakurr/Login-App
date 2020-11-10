import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
