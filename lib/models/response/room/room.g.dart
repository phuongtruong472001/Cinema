// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomResponseImpl _$$RoomResponseImplFromJson(Map<String, dynamic> json) => _$RoomResponseImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      seats: (json['seats'] as List<dynamic>?)?.map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList(),
    );

Map<String, dynamic> _$$RoomResponseImplToJson(_$RoomResponseImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'capacity': instance.capacity,
      'seats': instance.seats,
    };
