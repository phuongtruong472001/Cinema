import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s7_cinema/const/api_url.dart';
import 'package:s7_cinema/datasource/network/dio_client.dart';
import 'package:s7_cinema/models/response/api_response.dart';
import 'package:s7_cinema/models/response/film/film.dart';

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

  @GET(ApiUrl.film)
  Future<ApiResponse> listFilm(@Body() Map<String, dynamic> body);

  @GET('${ApiUrl.film}/{id}')
  Future<ApiResponse<FilmResponse>> detailFilm(@Path() String id);

  @POST(ApiUrl.film)
  Future<ApiResponse> createFilm(@Body() Map<String, dynamic> body);

  @PATCH('${ApiUrl.film}/{id}')
  Future<ApiResponse> updateFilm(@Body() Map<String, dynamic> body, @Path() String id);

  @DELETE('${ApiUrl.film}/{id}')
  Future<ApiResponse> deleteFilm(@Path() String id);
}
