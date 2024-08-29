// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showtimes_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShowtimesDetailResponseImpl _$$ShowtimesDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ShowtimesDetailResponseImpl(
      movie: json['movie'] == null
          ? null
          : FilmResponse.fromJson(json['movie'] as Map<String, dynamic>),
      room: json['room'] == null
          ? null
          : RoomResponse.fromJson(json['room'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
      startTime: (json['startTime'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$ShowtimesDetailResponseImplToJson(
        _$ShowtimesDetailResponseImpl instance) =>
    <String, dynamic>{
      'movie': instance.movie,
      'room': instance.room,
      'price': instance.price,
      'startTime': instance.startTime,
      'id': instance.id,
    };
