
import 'package:dio/dio.dart';
import 'package:git_demo/network/rest_constants.dart';

class ApiClient {
  static final ApiClient _converter = ApiClient._internal();

  static const String REQUIRES_HEADER = "requiresHeader";

  factory ApiClient() {
    return _converter;
  }

  ApiClient._internal();

  Dio dio() {
    var dio = Dio(
      BaseOptions(
          connectTimeout: 20000,
          receiveTimeout: 20000,
          baseUrl: RestConstants.BASE_URL),
    );

    dio.interceptors.addAll(
      [
        LogInterceptor(
          error: true,
          requestBody: true,
        ),
      ],
    );
    return dio;
  }
}
