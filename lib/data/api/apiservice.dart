import 'package:dio/dio.dart';
import 'package:flutterapp/data/api/apis.dart';

class ApiService {
  Dio dio = new Dio();

  ///获取轮播网络的数据
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
}
