import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat till Dawn',
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? kIOSTheme
            : kDefaultTheme,
        home: ChatScreen());
  }
}

final ThemeData kIOSTheme = new ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
    textTheme: TextTheme(body1: TextStyle(fontSize: 17)),
    iconTheme: IconThemeData(color: Colors.orange));

final ThemeData kDefaultTheme = new ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.orangeAccent[400],
    textTheme: TextTheme(body1: TextStyle(fontSize: 17)),
    iconTheme: IconThemeData(color: Colors.purple));
