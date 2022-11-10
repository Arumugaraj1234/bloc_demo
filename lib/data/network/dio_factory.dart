import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:unit_test_app/core/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "Language";
const String AUTHORIZATION_TOKEN = "AUTHORIZATION_TOKEN";

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();

    int _timeOut = 60 * 1000; // 1 minute
    String language = "en";

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: AUTHORIZATION_TOKEN,
      DEFAULT_LANGUAGE: language
    };
    dio.options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        headers: headers);
    if (kReleaseMode) {
      // ignore: avoid_print
      print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
