import 'package:freezed_annotation/freezed_annotation.dart';

part 'film.freezed.dart';
part 'film.g.dart';

@freezed
class FilmResponse with _$FilmResponse {
  factory FilmResponse({
    String? id,
    String? name,
    int? duration,
    String? description,
    String? thumbnail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FilmResponse;

  factory FilmResponse.fromJson(Map<String, dynamic> json) => _$FilmResponseFromJson(json);
}
