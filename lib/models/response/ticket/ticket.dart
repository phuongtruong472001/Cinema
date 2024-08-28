import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s7_cinema/models/response/showtimes_detail/showtimes_detail.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class TicketResponse with _$TicketResponse {
  factory TicketResponse({
    final ShowtimesDetailResponse? showtime,
    final int? startTime,
    final String? id,
    final String? seat,
    final String? user,
  }) = _TicketResponse;

  factory TicketResponse.fromJson(Map<String, dynamic> json) => _$TicketResponseFromJson(json);
}
