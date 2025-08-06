import 'package:europen_countries_app/core/constants/app_constants.dart';
import 'package:europen_countries_app/core/services/injection_container.dart';
import 'package:dio/dio.dart';

class DioBase {
  late Dio dio;
  DioBase() {
    dio = getIt<Dio>();
    dio.options.baseUrl = AppConstants.apiUrl;
    dio.options.connectTimeout = AppConstants.connectTimeout;
    dio.options.headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
  }

  void addInterceptor(List<Interceptor> interceptors) {
    dio.interceptors.addAll(interceptors);
  }

  Future<Response> post<T>(String path, T data) async {
    return await dio.post(path, data: data);
  }

  Future<Response> get(String path) async {
    return await dio.get(path);
  }
}
