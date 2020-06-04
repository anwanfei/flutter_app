import 'package:flutter/material.dart';
import 'package:flutterapp/ui/welcome_screen.dart';

main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter",
      home: WelcomeScreen(),
      theme: ThemeData(accentColor: Colors.red),
    );
  }
}
