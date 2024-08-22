import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class RoomResponse with _$RoomResponse {
  factory RoomResponse({
    String? id,
    String? name,
    int? capacity,
    List<List<String?>>? seats,
  }) = _RoomResponse;

  factory RoomResponse.fromJson(Map<String, dynamic> json) => _$RoomResponseFromJson(json);
}
