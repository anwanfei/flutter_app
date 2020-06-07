import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/main_screen.dart';
import 'package:flutterapp/ui/splash_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreen();
  }
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎页'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
//                shape: BoxShape.rectangle,
//                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                image: DecorationImage(
                    image: AssetImage('assets/images/jiyun.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
