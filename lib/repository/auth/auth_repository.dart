import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s7_cinema/const/api_url.dart';
import 'package:s7_cinema/datasource/network/dio_client.dart';
import 'package:s7_cinema/models/response/api_response.dart';
import 'package:s7_cinema/models/response/login_response/login_response.dart';

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

  @POST(ApiUrl.login)
  Future<ApiResponse<LoginResponse>> login(@Body() Map<String, dynamic> body);

  @POST(ApiUrl.register)
  Future<ApiResponse<LoginResponse>> register(@Body() Map<String, dynamic> body);
}
