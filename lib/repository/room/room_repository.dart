import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s7_cinema/const/api_url.dart';
import 'package:s7_cinema/datasource/network/dio_client.dart';
import 'package:s7_cinema/models/response/api_response.dart';
import 'package:s7_cinema/models/response/room/room.dart';

part 'room_repository.g.dart';

class ApiRoom {
  ApiRoom._();
  static final ApiRoom _apiRoom = ApiRoom._();
  static ApiRoom get instance => _apiRoom;

  RestClientApi get restClient => RestClientApi(dioClient(ApiUrl.baseUrl));
}

@RestApi(baseUrl: ApiUrl.baseUrl)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

  @GET(ApiUrl.room)
  Future<ApiResponse> listRoom(@Body() Map<String, dynamic> body);

  @GET('${ApiUrl.room}/{id}')
  Future<ApiResponse<RoomResponse>> detailRoom(@Path() String id);

  @POST(ApiUrl.room)
  Future<ApiResponse> createRoom(@Body() Map<String, dynamic> body);

  @PATCH('${ApiUrl.room}/{id}')
  Future<ApiResponse> updateRoom(@Body() Map<String, dynamic> body, @Path() String id);

  @DELETE('${ApiUrl.room}/{id}')
  Future<ApiResponse> deleteRoom(@Path() String id);
}
