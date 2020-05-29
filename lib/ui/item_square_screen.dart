import 'package:flutter/material.dart';
import 'package:flutterapp/data/model/article_model.dart';

// ignore: must_be_immutable
class ItemSquareScren extends StatefulWidget {
  ArticleBean articleBean;

  ItemSquareScren(this.articleBean);

  @override
  State<StatefulWidget> createState() {
    return _ItemSquareScrenn();
  }
}

class _ItemSquareScrenn extends State<ItemSquareScren> {
  @override
  Widget build(BuildContext context) {
    ArticleBean articleBean = widget.articleBean;
    return Card(
      child: InkWell(
        onTap: () {
          print(articleBean.link);
        },
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
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: Text(articleBean.title),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    articleBean.superChapterName +
                        "/" +
                        articleBean.chapterName,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        articleBean.collect
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 14,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
