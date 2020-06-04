import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/wx_chapters_model.dart';
import 'package:flutterapp/ui/wx_article_screen.dart';
import 'package:flutterapp/utils/loading_util.dart';

class WxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WxPage();
  }
}

class _WxPage extends State<WxPage> with TickerProviderStateMixin {
  WXChaptersModel _wxChaptersModel = WXChaptersModel();
  TabController _tabController;
  List<Tab> tabs = [
    Tab(
      text: '汽车',
    ),
    Tab(
      text: '汽车',
    )
  ];

  @override
  void initState() {
    super.initState();
    getWxTitleData();
  }

  getWxTitleData() async {
    await ApiService().getWxTitleData().then((value) {
      var data = json.decode(value.toString());
      setState(() {
        _wxChaptersModel = WXChaptersModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_wxChaptersModel.data == null) return LoadingUtil.loading();
    _tabController =
        new TabController(length: _wxChaptersModel.data.length, vsync: this);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              child: TabBar(
                isScrollable: true,
                tabs: _wxChaptersModel.data.map((wXChaptersBean) {
                  return Tab(
                    text: wXChaptersBean.name,
                  );
                }).toList(),
                controller: _tabController,
                indicatorColor: Colors.white,
              ),
            ),
            Expanded(
                child: Container(
              child: TabBarView(
                controller: _tabController,
                children: _wxChaptersModel.data.map((wXChaptersBean) {
                  return WxArticleScreen(wXChaptersBean.id);
                }).toList(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
