// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:s7_cinema/const/api_url.dart';
// import 'package:s7_cinema/datasource/network/dio_client.dart';

// part 'auth_repository.g.dart';

// class ApiLogin {
//   ApiLogin._();
//   static final ApiLogin _apiLogin = ApiLogin._();
//   static ApiLogin get instance => _apiLogin;

//   RestClientApi get restClient => RestClientApi(dioClient(ApiUrl.baseUrl));
// }

// @RestApi(baseUrl: ApiUrl.baseUrl)
// abstract class RestClientApi {
//   factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

//   ///em gen file .g thôi
//   // Future<Response> login(@Body() Map<String, dynamic> body);
// }
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s7_cinema/const/api_url.dart';

import '../../datasource/network/dio_client.dart';

// import '../../constants/end_points.dart';
// import '../../models/doctor/doctor.dart';
// import '../../models/response/api_response.dart';
// import '../../models/user/user.dart';
// import '../../services/dio_client.dart';

part 'auth_repository.g.dart';

class ApiLogin {
  ApiLogin._();
  static final ApiLogin _apiLogin = ApiLogin._();
  static ApiLogin get instance => _apiLogin;

  RestClientApi get restClient => RestClientApi(dioClient(ApiUrl.baseUrl));
}

@RestApi(baseUrl: ApiUrl.baseUrl)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;
}
