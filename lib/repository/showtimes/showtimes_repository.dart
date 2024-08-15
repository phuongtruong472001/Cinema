import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s7_cinema/const/api_url.dart';
import 'package:s7_cinema/datasource/network/dio_client.dart';
import 'package:s7_cinema/models/response/api_response.dart';
import 'package:s7_cinema/models/response/showtimes/showtimes.dart';

part 'showtimes_repository.g.dart';

class ApiShowtimes {
  ApiShowtimes._();
  static final ApiShowtimes _apiShowtimes = ApiShowtimes._();
  static ApiShowtimes get instance => _apiShowtimes;

  RestClientApi get restClient => RestClientApi(dioClient(ApiUrl.baseUrl));
}

@RestApi(baseUrl: ApiUrl.baseUrl)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

  @GET(ApiUrl.showtimes)
  Future<ApiResponse> listShowtimes(@Body() Map<String, dynamic> body);

  @GET('${ApiUrl.showtimes}/{id}')
  Future<ApiResponse<ShowtimesResponse>> detailShowtimes(@Path() String id);

  @POST(ApiUrl.showtimes)
  Future<ApiResponse> createShowtimes(@Body() Map<String, dynamic> body);

  @PATCH('${ApiUrl.showtimes}/{id}')
  Future<ApiResponse> updateShowtimes(@Body() Map<String, dynamic> body, @Path() String id);

  @DELETE('${ApiUrl.showtimes}/{id}')
  Future<ApiResponse> deleteShowtimes(@Path() String id);
}
