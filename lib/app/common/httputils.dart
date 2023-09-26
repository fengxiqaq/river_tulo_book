import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Http {
  static String domain = "https://pcapi-xiaotuxian-front.itheima.net";
  static Dio dio = Dio();
  Http() {
    dio.options.connectTimeout = const Duration(seconds: 10); //5s
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.options.validateStatus = (status) {
      return status! <= 500;
    };
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final listOfPaths = <String>[
          '/member/profile',
        ];
        // 检查如果请求端点匹配
        if (!listOfPaths.contains(options.path.toString())) {
          // 在这里加载令牌到 header
          var token = await getSPToken();
          options.headers.addAll({'Authorization': token});
          return handler.next(options);
        }
        else {
          // 如果端点不匹配然后跳到追加令牌
          return handler.next(options);
        }
      }
    ));
  }

  Future get(apiUrl, {Map? data}) async {
    try {
      Response response = await dio.get(domain + apiUrl, data: data);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future post(String apiUrl, {Map? data}) async {
    try {
      Response response = await dio.post(domain + apiUrl, data: data);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future put(String apiUrl, {Map? data}) async {
    try {
      Response response = await dio.put(domain + apiUrl, data: data);
      return response;
    } catch (e) {
      return null;
    }
  }

  uploadImg(imageUrl) async{
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
          imageUrl.toString(),
      )
    });
    var result = await dio.post("$domain/member/profile/avatar", data: formData);
    return result.data;
  }

  static replaeUri(picUrl) {
    String tempUrl = domain + picUrl;
    return tempUrl.replaceAll("\\", "/");
  }

  static getSPToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
  }
}
