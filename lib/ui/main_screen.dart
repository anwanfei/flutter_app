import 'package:flutter/material.dart';
import 'package:flutterapp/ui/home_page.dart';
import 'package:flutterapp/ui/knowlege_page.dart';
import 'package:flutterapp/ui/square_page.dart';
import 'package:flutterapp/ui/wx_page.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {
  List<Widget> list = List();
  int _currentIndext = 0;

  @override
  void initState() {
    super.initState();
    list
      ..add(HomePage())
      ..add(SquarePage())
      ..add(WxPage())
      ..add(KnowlegePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: drawerScrenn(),
      ),
      appBar: AppBar(
        title: Text('首页'),
//        leading: Icon(Icons.print),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                print('分享');
              }),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              PopupMenuItem(
                child: Text('条目一'),
                value: "1",
              ),
              PopupMenuItem(
                child: Text('条目二'),
                value: "2",
              ),
              PopupMenuItem(
                child: Text('条目三'),
                value: "3",
              ),
            ],
            onSelected: (String action) {
              switch (action) {
                case "1":
                  print('条目1');
                  break;
                case "2":
                  print('条目2');
                  break;
                case "3":
                  print('条目3');
                  break;
              }
            },
          ),
        ],
      ),
      body: list[_currentIndext],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndext,
        onTap: (int index) {
          setState(() {
            _currentIndext = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text(
              '首页',
            ),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '广场',
            ),
            icon: Icon(
              Icons.crop_square,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '公众号',
            ),
            icon: Icon(
              Icons.public,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '体系',
            ),
            icon: Icon(
              Icons.settings_system_daydream,
            ),
          ),
        ],
      ),
    );
  }
}

class drawerScrenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('大飞'),
          accountEmail: Text('anfly@com'),
          currentAccountPicture: Image.network(
              'http://ww4.sinaimg.cn/large/7a8aed7bjw1exp4h479xfj20hs0qoq6t.jpg'),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.red,
          ),
          title: Text(
            '设置',
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
            print('点击了设置');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.print,
            color: Colors.red,
          ),
          title: Text(
            '打印机',
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
            print('点击了打印机');
          },
        ),
      ],
    );
  }
}
