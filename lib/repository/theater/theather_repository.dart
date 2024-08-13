import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s7_cinema/const/api_url.dart';
import 'package:s7_cinema/datasource/network/dio_client.dart';
import 'package:s7_cinema/models/response/api_response.dart';

part 'theather_repository.g.dart';

class ApiTheater {
  ApiTheater._();
  static final ApiTheater _apiTheater = ApiTheater._();
  static ApiTheater get instance => _apiTheater;

  RestClientApi get restClient => RestClientApi(dioClient(ApiUrl.baseUrl));
}

@RestApi(baseUrl: ApiUrl.baseUrl)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

  @POST(ApiUrl.theater)
  Future<ApiResponse> listTheater(@Body() Map<String, dynamic> body);

  @POST(ApiUrl.theaterDetail)
  Future<ApiResponse> detailTheater(@Body() Map<String, dynamic> body);
}
