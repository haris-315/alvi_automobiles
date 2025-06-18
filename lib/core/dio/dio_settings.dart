import 'package:dio/dio.dart';

class DioSettings {
  static const String baseUrl = "https://avliautomobiles.com";
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 12),
      headers: {"User-Agent": "avliautmobiles@alviautmobiles.com"},
    ),
  );

  static Future<bool> checkConnectivity() async {
    final res = await dio.get("https://google.com");
    return (res.statusCode ?? 0) == 200;
  }
}
