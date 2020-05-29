import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/article_model.dart';
import 'package:flutterapp/ui/item_square_screen.dart';

class SquarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SquarePage();
  }
}

class _SquarePage extends State<SquarePage> {
  ArticleModel _articleModel = ArticleModel();
  ScrollController _scrollController = new ScrollController();
  int _page = 0;

  @override
  void initState() {
    super.initState();
    getSquareData();
  }

  getSquareData() async {
    await ApiService().getSquareData(_page).then((value) {
      var data = json.decode(value.toString());
      setState(() {
        _articleModel = ArticleModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemView,
      controller: _scrollController,
      itemCount: _articleModel.data.datas.length,
    );
  }

  Widget itemView(BuildContext context, int index) {
    ArticleBean articleBean = _articleModel.data.datas[index];
    return ItemSquareScren(articleBean);
  }
}
