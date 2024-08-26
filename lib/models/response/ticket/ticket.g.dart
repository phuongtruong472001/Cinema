// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketResponseImpl _$$TicketResponseImplFromJson(Map<String, dynamic> json) => _$TicketResponseImpl(
      showtime: json['showtime'] == null ? null : ShowtimesDetailResponse.fromJson(json['showtime'] as Map<String, dynamic>),
      startTime: (json['startTime'] as num?)?.toInt(),
      id: json['_id'] as String?,
      seat: json['seat'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$TicketResponseImplToJson(_$TicketResponseImpl instance) => <String, dynamic>{
      'showtime': instance.showtime,
      'startTime': instance.startTime,
      'id': instance.id,
      'seat': instance.seat,
      'user': instance.user,
    };
