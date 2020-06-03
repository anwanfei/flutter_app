import 'package:dio/dio.dart';
import 'package:flutterapp/data/api/apis.dart';

class ApiService {
  Dio dio = new Dio();

  ///获取轮播网络数据
  getSwipersData() async {
    try {
      Response response = await dio.get(Apis.HOME_BANNER);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return response;
      } else {
        throw Exception('网络网络异常');
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取首页列表数据,future
  getHomeArticleListDdata(int _page) async {
    try {
      Response response =
          await dio.get(Apis.HOME_ARTICLE_LIST + "/$_page/json");
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常：' + response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取广场数据
  getSquareData(int _page) async {
    try {
      Response response = await dio.get(Apis.SQUARE_LIST + "/$_page/json");
      int code = response.statusCode;
      if (code == 200) {
        return response;
      } else {
        throw Exception('网络异常');
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取体系数据
  getKnowledgeTreeData() async {
    try {
      Response response = await dio.get(Apis.KNOWLEDGE_TREE_LIST);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常：' + response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取体系数据
  getNavigationData() async {
    try {
      Response response = await dio.get(Apis.NAVIGATION_LIST);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常：' + response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取公众号tab名称
  getWxTitleData() async {
    try {
      Response response = await dio.get(Apis.WX_CHAPTERS_LIST);
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常' + response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取公众号文章列表
  getWxArticleListData(int page, int id) async {
    try {
      Response response =
          await dio.get(Apis.WX_ARTICLE_LIST + "/$id/$page/json");

      var statusCode = response.statusCode;

      if (statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常：' + response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }
}
