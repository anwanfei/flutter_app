import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/navigation_model.dart';
import 'package:flutterapp/utils/loading_util.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationScreen();
  }
}

class _NavigationScreen extends State<NavigationScreen> {
  NavigationModel _navigationModel = NavigationModel();
  ScrollController _controller = new ScrollController();

  @override
  void initState() {

    super.initState();
    getNavigationData();
  }

  getNavigationData() async {
    await ApiService().getNavigationData().then((value) {
      var dada = json.decode(value.toString());
      setState(() {
        _navigationModel = NavigationModel.fromJson(dada);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_navigationModel.data == null) return LoadingUtil.loading();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: itemView,
        controller: _controller,
        itemCount: _navigationModel.data.length,
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    var navigationBean = _navigationModel.data[index];
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text(navigationBean.name),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
          alignment: Alignment.centerLeft,
          child: Wrap(
            runSpacing: 0.0,
            spacing: 8,
            children: itemChipView(navigationBean.articles),
          ),
        ),
        Divider(height: 0.5)
      ],
    );
  }

  itemChipView(List<NavigationArticleBean> articles) {
    List<Widget> list = [];

    for (var value in articles) {
      Widget chip = InkWell(
        onTap: () {
          print(value.title);
        },
        child: Chip(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          label: Text(
            value.title,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      );
      list.add(chip);
    }

    return list;
  }
}
