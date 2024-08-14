import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:s7_cinema/const/app_key.dart';
import 'package:s7_cinema/datasource/local/storage.dart';

// import '../main.dart';
final box = GetStorage();

Dio dioClient(String baseUrl) {
  final dio = Dio();

  dio.options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  dio.interceptors.addAll([
    InterceptorsWrapper(
      onRequest: requestInterceptor,
      onResponse: responseInterceptor,
      onError: (DioException error, ErrorInterceptorHandler handler) {
        return errorInterceptor(error, handler, dio);
      },
    ),
  ]);

  return dio;
}

dynamic requestInterceptor(
  RequestOptions request,
  RequestInterceptorHandler handler,
) async {
  //add token to header
  request.headers.addAll({
    'Content-Type': 'application/json',
  });
  final token = BaseBox.getToken();
  if (token != '') {
    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });
  }
  Logger().i({
    request.method: request.uri,
    'headers': request.headers,
    'body': request.data,
  });
  return handler.next(request);
}

dynamic responseInterceptor(
  Response response,
  ResponseInterceptorHandler handler,
) async {
  if (response.statusCode == 200 || response.statusCode == 201) {
    dynamic data = response.data;
    Logger().d({
      'body': data,
    });
    return handler.next(
      Response(
        requestOptions: response.requestOptions,
        data: data,
      ),
    );
  }
  return DioException(
    requestOptions: response.requestOptions,
    error: response.data,
  );
}

dynamic errorInterceptor(DioException error, ErrorInterceptorHandler handler, Dio dio) async {
  try {
    if (error.response?.statusCode == 401) {
      // this will push a new route and remove all the routes that were present
      // handle error api , example token expired
      final response = await apiCallToRefreshToken(dio);
      final newToken = response['token'];

      box.write(AppKeys.token, newToken);

      // call request
      RequestOptions requestOptions = error.requestOptions;
      requestOptions.headers['Authorization'] = 'Bearer $newToken';
      return dio.request(requestOptions.path,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters);
    }
    handler.next(error);
  } catch (e) {
    box.remove(AppKeys.token);

    //navigatorKey.currentState?.pushReplacementNamed(AppRoutes.login, arguments: {'expiredToken': true});
  }
}

Future<Map<String, dynamic>> apiCallToRefreshToken(Dio dio) async {
  try {
    final oldRefreshToken = await box.read(AppKeys.token);
    final Response response = await dio.post('/auth/refresh_token', data: {'refreshToken': oldRefreshToken});
    if (response.statusCode == 200) {
      String newToken = response.data['token'];
      String newRefreshToken = response.data['refreshToken'];
      return {'token': newToken, 'refreshToken': newRefreshToken};
    } else {
      throw Exception('Failed to refresh token');
    }
  } catch (error) {
    throw Exception('Error refreshing token: $error');
  }
}
