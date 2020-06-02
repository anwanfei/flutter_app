import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/knowledge_tree_model.dart';

class KnowledgeTreeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KnowledgeTreeScreen();
  }
}

class _KnowledgeTreeScreen extends State<KnowledgeTreeScreen> {
  KnowledgeTreeModel _knowledgeTreeModel = KnowledgeTreeModel();
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    getKnowledgeTreeData();
  }

  getKnowledgeTreeData() async {
    await ApiService().getKnowledgeTreeData().then((value) {
      var data = json.decode(value.toString());

      setState(() {
        _knowledgeTreeModel = KnowledgeTreeModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: itemView,
        controller: _controller,
        itemCount: _knowledgeTreeModel.data.length,
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    KnowledgeTreeBean knowledgeTreeBean = _knowledgeTreeModel.data[index];
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          knowledgeTreeBean.name,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 10),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 8.0,
                          runSpacing: 1.0,
                          children: itemWrapView(knowledgeTreeBean.children),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 14,
                ),
              )
            ],
          ),
          Divider(
            height: 0.5,
          ),
        ],
      ),
    );
  }

  itemWrapView(List<KnowledgeTreeChildBean> children) {
//    List<Text> list = [];
    List<Widget> list = [];
    for (var value in children) {
      list.add(Text(value.name,style: TextStyle(
        fontSize: 12,
        color: Colors.grey
      ),));
    }
    return list;
  }
}
