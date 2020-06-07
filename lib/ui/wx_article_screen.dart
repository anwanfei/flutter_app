import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/wx_article_model.dart';
import 'package:flutterapp/utils/loading_util.dart';

class WxArticleScreen extends StatefulWidget {
  int id;

  WxArticleScreen(this.id);

  @override
  State<StatefulWidget> createState() {
    return _WxArticleScrenen();
  }
}

class _WxArticleScrenen extends State<WxArticleScreen> {
  int page = 0;
  int id;

//  _WxArticleScrenen(this.id);

  WXArticleModel _articleModel = new WXArticleModel();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    id = widget.id;

    getWxArticleListData();
  }

  getWxArticleListData() async {
    await ApiService().getWxArticleListData(page, id).then((value) {
      var data = json.decode(value.toString());
      setState(() {
        _articleModel = WXArticleModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_articleModel.data == null) return LoadingUtil.loading();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: itemView,
        controller: _scrollController,
        itemCount: _articleModel.data.datas.length,
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    var wxArticleBean = _articleModel.data.datas[index];
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  wxArticleBean.author.isEmpty
                      ? wxArticleBean.shareUser
                      : wxArticleBean.author,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )),
                Container(
                  child: Text(
                    wxArticleBean.niceShareDate,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Text(wxArticleBean.title),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Text(
                  wxArticleBean.superChapterName +
                      "/" +
                      wxArticleBean.chapterName,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    wxArticleBean.collect
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 14,
                    color: Colors.grey,
                  ),
                ))
              ],
            ),
          ),
          Divider(
            height: 0.5,
          )
        ],
      ),
    );
  }
}
