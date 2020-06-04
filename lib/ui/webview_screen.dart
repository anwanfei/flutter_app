import 'package:flutter/material.dart';

class WebViewScreen extends StatefulWidget {
  String title;
  String link;

  WebViewScreen(this.title, this.link);

  @override
  State<StatefulWidget> createState() {
    return _WebViewScreen();
  }
}

class _WebViewScreen extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    String link = widget.link;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(link),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, "我是webview数据");
              },
              child: Text("点我退出界面"),
            )
          ],
        ),
      ),
    );
  }
}
