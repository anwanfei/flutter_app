import 'package:flutter/material.dart';
import 'package:flutterapp/ui/knowledge_tree_screen.dart';
import 'package:flutterapp/ui/navigation_screen.dart';

class KnowlegePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KnowlegePage();
  }
}

class _KnowlegePage extends State<KnowlegePage> with TickerProviderStateMixin {
  TabController _tabControlor;

  List<Tab> tabs = [
    Tab(
      text: '体系',
//      icon: Icon(Icons.sort),
    ),
    Tab(
      text: '导航',
//      icon: Icon(Icons.navigation),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _tabControlor = new TabController(length: tabs.length, vsync: this);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: TabBar(
                indicatorColor: Colors.white,
                tabs: tabs,
                controller: _tabControlor),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabControlor,
            children: <Widget>[KnowledgeTreeScreen(), NavigationScreen()],
          ))
        ],
      ),
    );
  }
}
