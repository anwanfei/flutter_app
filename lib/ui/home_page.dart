import 'dart:convert';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data/api/apiservice.dart';
import 'package:flutterapp/data/model/banner_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  BannerModel _bannerModel = BannerModel();

  List<String> imgs = [
    "http://ww4.sinaimg.cn/large/7a8aed7bjw1exp4h479xfj20hs0qoq6t.jpg",
    "http://ww1.sinaimg.cn/large/0065oQSqly1frepozc5taj30qp0yg7aq.jpg",
    "http://ww1.sinaimg.cn/large/0065oQSqly1frept5di16j30p010g0z9.jpg"
  ];

  @override
  void initState() {
    super.initState();
    getSwiperData();
  }

  void getSwiperData() async {
    await ApiService().getSwipersData().then((value) {
      //解码得到数据
      var data = json.decode(value.toString());
      setState(() {
        _bannerModel = BannerModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Swiper(
        autoplay: true,
        itemCount: _bannerModel.data.length,
        pagination: SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _bannerModel.data[index].imagePath,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
