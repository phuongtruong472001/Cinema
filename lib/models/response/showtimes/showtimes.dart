import 'package:freezed_annotation/freezed_annotation.dart';

part 'showtimes.freezed.dart';
part 'showtimes.g.dart';

@freezed
class ShowtimesResponse with _$ShowtimesResponse {
  factory ShowtimesResponse({
    String? id,
    String? name,
    int? duration,
    String? description,
    String? thumbnail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ShowtimesResponse;

  factory ShowtimesResponse.fromJson(Map<String, dynamic> json) => _$ShowtimesResponseFromJson(json);
}
