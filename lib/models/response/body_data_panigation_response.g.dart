// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_data_panigation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyDataPanigationResponse<T> _$BodyDataPanigationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BodyDataPanigationResponse<T>(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BodyDataPanigationResponseToJson<T>(
  BodyDataPanigationResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'data': instance.data.map(toJsonT).toList(),
    };
