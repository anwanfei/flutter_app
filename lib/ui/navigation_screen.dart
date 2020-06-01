import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationScreen();
  }
}

class _NavigationScreen extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('导航'),
    );
  }
}
