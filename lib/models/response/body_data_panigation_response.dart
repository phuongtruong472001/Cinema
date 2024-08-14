import 'package:freezed_annotation/freezed_annotation.dart';

import 'data/pagination.dart';
part 'body_data_panigation_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BodyDataPanigationResponse<T> {
  final Pagination? pagination;
  final List<T> data;

  BodyDataPanigationResponse({
    this.pagination,
    required this.data,
  });

  factory BodyDataPanigationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BodyDataPanigationResponseFromJson(json, fromJsonT);
}
