// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showtimes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomResponseImpl _$$RoomResponseImplFromJson(Map<String, dynamic> json) => _$RoomResponseImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RoomResponseImplToJson(_$RoomResponseImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
