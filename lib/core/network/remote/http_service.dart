import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '/core/core.dart';

class HttpService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  late String _baseUrl;
  late String _apiKey;

  HttpService() {
    AppConfig config = getIt.get<AppConfig>();
    _baseUrl = config.baseApiUrl;
    _apiKey = config.apiKey;
  }

  Future<Response?> get(String path, {Map<String, dynamic>? query}) async {
    try {
      String url = "$_baseUrl$path";

      Map<String, dynamic> query0 = {
        "api_key": _apiKey,
        "language": "en-US",
      };

      if (query != null) {
        query0.addAll(query);
      }

      return await dio.get(
        path,
        queryParameters: query,
      );
    } on DioException catch (e) {
      log("Unable to preform get request");
      log("Dio Error: $e");
      return null;
    }
  }
}
