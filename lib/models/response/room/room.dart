import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class ShowtimesResponse with _$ShowtimesResponse {
  factory ShowtimesResponse({
    String? id,
    String? name,
    int? capacity,
    List<List<String>>? seats,
  }) = _ShowtimesResponse;

  factory ShowtimesResponse.fromJson(Map<String, dynamic> json) => _$ShowtimesResponseFromJson(json);
}
