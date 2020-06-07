import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/ui/main_screen.dart';
import 'package:flutterapp/ui/welcome_screen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(Slide(
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        title: "第一页",
        marginDescription: EdgeInsets.all(20),
        description: "这里是我们的第一页",
        styleDescription: TextStyle(color: Colors.white, fontSize: 20.0)));

    slides.add(Slide(
        colorBegin: Color(0xffFFFACD),
        colorEnd: Color(0xffFF6347),
        title: "第二页",
        marginDescription: EdgeInsets.all(20),
        description: "这里是我们的第二页",
        styleDescription: TextStyle(color: Colors.white, fontSize: 20.0)));

    slides.add(Slide(
        colorBegin: Color(0xffFFA500),
        colorEnd: Color(0xff7FFFD4),
        directionColorBegin: Alignment.bottomCenter,
        directionColorEnd: Alignment.topRight,
        marginDescription: EdgeInsets.all(20),
        title: "第三页",
        description: "这里是我们的第第二页",
        styleDescription: TextStyle(color: Colors.white, fontSize: 20.0)));
  }

  //完成方法
  void onDonePress() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => MainScreen()),
        (route) => route == null);
  }

  //跳过方法
  void onSkipPress() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => MainScreen()),
        (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: onDonePress,
      onSkipPress: onSkipPress,
      nameDoneBtn: "完成",
      nameNextBtn: '下一页',
      namePrevBtn: "上一页",
      nameSkipBtn: '跳过',
    );
  }
}
