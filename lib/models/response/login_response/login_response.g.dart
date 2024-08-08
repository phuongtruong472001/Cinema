// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse<T> _$LoginResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    LoginResponse<T>(
      name: json['name'] as String?,
      email: json['email'] as String?,
      status: (json['status'] as num?)?.toInt(),
      role: (json['role'] as num?)?.toInt(),
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson<T>(
  LoginResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'status': instance.status,
      'role': instance.role,
      'accessToken': instance.accessToken,
    };
