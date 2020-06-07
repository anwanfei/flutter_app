import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/article_model.dart';
import 'package:flutterapp/ui/item_square_screen.dart';
import 'package:flutterapp/utils/loading_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SquarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SquarePage();
  }
}

class _SquarePage extends State<SquarePage> {
  List<ArticleBean> _articles = [];
  ScrollController _scrollController = new ScrollController();
  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);
  int _page = 0;

  void loadMore() async {
    _page++;
    await ApiService().getSquareData(_page).then((value) {
      var data = json.decode(value.toString());
      _refreshController.loadComplete();
      setState(() {
        ArticleModel _articleModel = ArticleModel.fromJson(data);
        _articles.addAll(_articleModel.data.datas);
      });
    });
  }

  getSquareData() async {
    _page = 0;
    await ApiService().getSquareData(_page).then((value) {
      var data = json.decode(value.toString());
      _refreshController.refreshCompleted();
      setState(() {
        ArticleModel _articleModel = ArticleModel.fromJson(data);
        _articles = _articleModel.data.datas;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getSquareData();
  }

  @override
  Widget build(BuildContext context) {
    if (_articles.length <= 0) return LoadingUtil.loading();
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: MaterialClassicHeader(),
      footer: ClassicFooter(),
      onRefresh: getSquareData,
      onLoading: loadMore,
      controller: _refreshController,
      child: ListView.builder(
        itemBuilder: itemView,
        controller: _scrollController,
        itemCount: _articles.length,
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    ArticleBean articleBean = _articles[index];
    return ItemSquareScren(articleBean);
  }
}

/// 自定义 FooterView
class RefreshFooter extends CustomFooter {
  @override
  double get height => 40;

  @override
  FooterBuilder get builder => (context, mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("上拉加载更多~");
        } else if (mode == LoadStatus.loading) {
          body = Wrap(
            spacing: 6,
            children: <Widget>[
              CupertinoActivityIndicator(),
              Text("加载中..."),
            ],
          );
        } else if (mode == LoadStatus.failed) {
          body = Text("加载失败，点击重试~");
        } else {
          body = Text("没有更多数据了~");
        }
        return Container(
          height: 40,
          child: Center(child: body),
        );
      };
}
