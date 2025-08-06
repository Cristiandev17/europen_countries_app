import 'package:dio/dio.dart';

class CountryInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Manejar errores específicos de la API de países
    if (err.response?.statusCode == 404) {
      // La región o país no existe
    } else if (err.response?.statusCode == 500) {
      // Error del servidor
    }

    // Puedes transformar el error aquí si lo deseas
    handler.next(err);
  }
}
