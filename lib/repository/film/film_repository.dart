import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s7_cinema/const/api_url.dart';
import 'package:s7_cinema/datasource/network/dio_client.dart';
import 'package:s7_cinema/models/response/api_response.dart';

part 'film_repository.g.dart';

class ApiFilm {
  ApiFilm._();
  static final ApiFilm _apiFilm = ApiFilm._();
  static ApiFilm get instance => _apiFilm;

  RestClientApi get restClient => RestClientApi(dioClient(ApiUrl.baseUrl));
}

@RestApi(baseUrl: ApiUrl.baseUrl)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

  @POST(ApiUrl.film)
  Future<ApiResponse> login(@Body() Map<String, dynamic> body);

  @POST(ApiUrl.filmDetail)
  Future<ApiResponse> register(@Body() Map<String, dynamic> body);
}
