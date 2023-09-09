import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../config/config.dart';
import '/core/core.dart';

class HttpService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  late String _baseUrl;
  late String _apiKey;

  HttpService() {
    // AppConfig config = getIt.get<AppConfig>();
    // _baseUrl = config.baseApiUrl;
    // _apiKey = config.apiKey;
  }


  // ****************
  ///   Get Language
  // ****************
  Future<void> getLanguage() async {
    ApiConstance.defaultLanguage =
        await sl<SharedPreferenceService>().getAppLanguage();
  }


  // ****************
  ///   Get Request
  // ****************
  Future<Response?> get(String path, {Map<String, dynamic>? query}) async {
    // LoggerDebug.loggerDebugMessage('get request');
    try {
      // String url = "${ApiConstance.baseUrl}$path";
      getLanguage();
      dio.options = ApiConstance.getBaseOption();

      final response = await dio.get(
        path,
        queryParameters: query ?? ApiConstance.query,
      );

      // LoggerDebug.loggerDebugMessage(path);
      // LoggerDebug.loggerDebugMessage(ApiConstance.defaultLanguage);
      // LoggerDebug.loggerDebugMessage(dio.options);
      // LoggerDebug.loggerDebugMessage(response.statusCode);
      // LoggerDebug.loggerDebugMessage(response.data);
      // LoggerDebug.loggerDebugMessage(ApiConstance.query);

      return response;
    } on DioException catch (e) {
      log("Unable to preform get request");
      log("Dio Error: $e");
      showSnackBar(e.message ?? "", showCloseIcon: true);
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    }
  }


  // ****************
  ///   Post Request
  // ****************
  // url = "https://api.themoviedb.org/3/movie/615656/rating"
  // {
  // "value":  3.50
  // }
  Future<Response?> post(String path,
      {required Map<String, dynamic> data, Map<String, dynamic>? query}) async {
    try {
      getLanguage();
      dio.options = ApiConstance.getBaseOption();

      final response = await dio.post(
        path,
        queryParameters: query ?? ApiConstance.query,
        data: data,
      );

      LoggerDebug.loggerDebugMessage(response.data);

      return response;
    } on DioException catch (e) {
      showSnackBar(e.message ?? "", showCloseIcon: true);
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    }
  }


  // ******************
  ///   Delete Request
  // ******************
  Future<Response?> delete(String path,
      {required Map<String, dynamic> data, Map<String, dynamic>? query}) async {
    try {
      getLanguage();
      dio.options = ApiConstance.getBaseOption();

      final response = await dio.delete(
        path,
        queryParameters: query ?? ApiConstance.query,
        data: data,
      );

      LoggerDebug.loggerDebugMessage(response.data);

      return response;
    } on DioException catch (e) {
      showSnackBar(e.message ?? "", showCloseIcon: true);
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    }
  }


  // ******************
  ///   Put Request
  // ******************
  Future<Response?> put(String path,
      {required Map<String, dynamic> data, Map<String, dynamic>? query}) async {
    try {
      getLanguage();
      dio.options = ApiConstance.getBaseOption();

      final response = await dio.put(
        path,
        queryParameters: query ?? ApiConstance.query,
        data: data,
      );

      LoggerDebug.loggerDebugMessage(response.data);

      return response;
    } on DioException catch (e) {
      showSnackBar(e.message ?? "", showCloseIcon: true);
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    }
  }
}
