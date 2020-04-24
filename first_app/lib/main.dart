import 'package:flutter/material.dart';
import 'package:first_app/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(100, 100, 100, 1.0)
      )
    );
  }
}
