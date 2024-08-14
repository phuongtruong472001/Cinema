import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination.dart';
part 'data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Data<T>  {
  T? data;
  Pagination? pagination;
  Data({this.data, this.pagination});

  factory Data.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataFromJson(json, fromJsonT);
}
