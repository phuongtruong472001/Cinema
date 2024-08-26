import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/models/response/room/room.dart';

part 'showtimes_detail.freezed.dart';
part 'showtimes_detail.g.dart';

@freezed
class ShowtimesDetailResponse with _$ShowtimesDetailResponse {
  factory ShowtimesDetailResponse({
    final FilmResponse? movie,
    final RoomResponse? room,
    final int? price,
    final int? startTime,
    final String? id,
  }) = _ShowtimesDetailResponse;

  factory ShowtimesDetailResponse.fromJson(Map<String, dynamic> json) => _$ShowtimesDetailResponseFromJson(json);
}
