import 'package:flutter/material.dart';
import 'package:flutterapp/data/model/article_model.dart';

class ItemHomeListScreen extends StatefulWidget {
  ArticleBean articleBean;

  ItemHomeListScreen(this.articleBean);

  @override
  State<StatefulWidget> createState() {
    return _ItemHomeListScreen();
  }
}

class _ItemHomeListScreen extends State<ItemHomeListScreen> {
  @override
  Widget build(BuildContext context) {
    var articleBean = this.widget.articleBean;
    return InkWell(
      //为了找一个有点击事件容器
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Text(
                  articleBean.author.isEmpty
                      ? articleBean.shareUser
                      : articleBean.author,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Expanded(
                    child: Text(
                  articleBean.niceShareDate,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Text(
              articleBean.title,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Text(
                  articleBean.superChapterName + '/' + articleBean.chapterName,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      articleBean.collect
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            ///分割线
            child: Divider(
              height: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
