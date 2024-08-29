// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) => _$LoginResponseImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      status: (json['status'] as num?)?.toInt(),
      role: (json['role'] as num?)?.toInt(),
      accessToken: json['accessToken'] as String?,
      verificationCode: json['verificationCode'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'status': instance.status,
      'role': instance.role,
      'accessToken': instance.accessToken,
      'verificationCode': instance.verificationCode,
      'id': instance.id,
    };
