import 'package:freezed_annotation/freezed_annotation.dart';

part 'showtimes.freezed.dart';
part 'showtimes.g.dart';

@freezed
class RoomResponse with _$RoomResponse {
  factory RoomResponse({
    String? id,
    String? name,
    int? duration,
    String? description,
    String? thumbnail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RoomResponse;

  factory RoomResponse.fromJson(Map<String, dynamic> json) => _$RoomResponseFromJson(json);
}
