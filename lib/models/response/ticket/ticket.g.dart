// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketResponseImpl _$$TicketResponseImplFromJson(Map<String, dynamic> json) =>
    _$TicketResponseImpl(
      movie: json['movie'] as String?,
      room: json['room'] as String?,
      price: (json['price'] as num?)?.toInt(),
      startTime: (json['startTime'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$TicketResponseImplToJson(
        _$TicketResponseImpl instance) =>
    <String, dynamic>{
      'movie': instance.movie,
      'room': instance.room,
      'price': instance.price,
      'startTime': instance.startTime,
      'id': instance.id,
    };
