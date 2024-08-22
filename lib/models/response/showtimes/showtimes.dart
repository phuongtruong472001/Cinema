import 'package:freezed_annotation/freezed_annotation.dart';

part 'showtimes.freezed.dart';
part 'showtimes.g.dart';

@freezed
class ShowtimesResponse with _$ShowtimesResponse {
  factory ShowtimesResponse({
    final String? movie,
    final String? room,
    final int? price,
    final int? startTime,
    final String? id,
  }) = _ShowtimesResponse;

  factory ShowtimesResponse.fromJson(Map<String, dynamic> json) => _$ShowtimesResponseFromJson(json);
}
