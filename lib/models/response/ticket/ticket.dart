import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class TicketResponse with _$TicketResponse {
  factory TicketResponse({
    final String? movie,
    final String? room,
    final int? price,
    final int? startTime,
    final String? id,
  }) = _TicketResponse;

  factory TicketResponse.fromJson(Map<String, dynamic> json) => _$TicketResponseFromJson(json);
}
