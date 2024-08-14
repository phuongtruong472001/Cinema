import 'package:freezed_annotation/freezed_annotation.dart';

import 'body_data_panigation_response.dart';
part 'pagination_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResponse<T> {
  final String? message;
  final String code;
  final BodyDataPanigationResponse<T> data;

  PaginationResponse({this.message, required this.data, required this.code});

  factory PaginationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationResponseFromJson(json, fromJsonT);
}
