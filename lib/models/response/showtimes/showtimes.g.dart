// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showtimes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShowtimesResponseImpl _$$ShowtimesResponseImplFromJson(Map<String, dynamic> json) => _$ShowtimesResponseImpl(
      movie: json['movie'] as String?,
      room: json['room'] as String?,
      price: (json['price'] as num?)?.toInt(),
      startTime: (json['startTime'] as num?)?.toInt(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$ShowtimesResponseImplToJson(_$ShowtimesResponseImpl instance) => <String, dynamic>{
      'movie': instance.movie,
      'room': instance.room,
      'price': instance.price,
      'startTime': instance.startTime,
      'id': instance.id,
    };
