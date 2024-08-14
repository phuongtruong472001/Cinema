// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShowtimesResponseImpl _$$ShowtimesResponseImplFromJson(Map<String, dynamic> json) => _$ShowtimesResponseImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      seats: (json['seats'] as List<dynamic>?)?.map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList(),
    );

Map<String, dynamic> _$$ShowtimesResponseImplToJson(_$ShowtimesResponseImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'capacity': instance.capacity,
      'seats': instance.seats,
    };
