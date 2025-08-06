import 'package:europen_countries_app/core/constants/app_constants.dart';
import 'package:europen_countries_app/core/services/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class DioBase {
  late Dio dio;
  late CacheStore _cacheStore;

  DioBase() {
    dio = getIt<Dio>();
    dio.options.baseUrl = AppConstants.apiUrl;
    dio.options.connectTimeout = AppConstants.connectTimeout;
    _setupCacheInterceptor();
  }

  void _setupCacheInterceptor() {
    _cacheStore = MemCacheStore(maxSize: 10 * 1024 * 1024, maxEntrySize: 1 * 1024 * 1024);

    final cacheOptions = CacheOptions(store: _cacheStore, hitCacheOnNetworkFailure: true, priority: CachePriority.normal);

    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  void addInterceptor(List<Interceptor> interceptors) {
    dio.interceptors.addAll(interceptors);
  }

  Future<Response> post<T>(String path, T data) async {
    return await dio.post(path, data: data, options: Options(extra: {'cache': false}));
  }

  Future<Response> get(String path, {bool forceRefresh = false, Duration? maxStale}) async {
    return await dio.get(
      path,
      options: Options(extra: {'cache': true, 'force_refresh': forceRefresh, 'max_stale': maxStale?.inSeconds}),
    );
  }

  Future<void> clearCache() async {
    await _cacheStore.clean();
  }

  Future<void> deleteFromCache(String url) async {
    await _cacheStore.delete(url);
  }

  Future<void> close() async {
    dio.close();
    await _cacheStore.close();
  }
}
