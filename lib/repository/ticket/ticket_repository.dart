import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s7_cinema/const/api_url.dart';
import 'package:s7_cinema/datasource/network/dio_client.dart';
import 'package:s7_cinema/models/response/api_response.dart';
import 'package:s7_cinema/models/response/ticket/ticket.dart';

part 'ticket_repository.g.dart';

class ApiTicket {
  ApiTicket._();
  static final ApiTicket _apiTicket = ApiTicket._();
  static ApiTicket get instance => _apiTicket;

  RestClientApi get restClient => RestClientApi(dioClient(ApiUrl.baseUrl));
}

@RestApi(baseUrl: ApiUrl.baseUrl)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

  @GET(ApiUrl.ticket)
  Future<ApiResponse> listTicket(@Body() Map<String, dynamic> body);

  @GET('${ApiUrl.ticket}/{id}')
  Future<ApiResponse<TicketResponse>> detailTicket(@Path() String id);

  @POST(ApiUrl.ticket)
  Future<ApiResponse> createTicket(@Body() Map<String, dynamic> body);

  @PATCH('${ApiUrl.ticket}/{id}')
  Future<ApiResponse> updateTicket(@Body() Map<String, dynamic> body, @Path() String id);

  @DELETE('${ApiUrl.ticket}/{id}')
  Future<ApiResponse> deleteTicket(@Path() String id);
}
