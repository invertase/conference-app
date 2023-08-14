import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required int id,
    required String? slug,
    required String reference,
    @JsonKey(name: 'qr_url') required String qr,
    required String name,
    required String email,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'unique_url') String? uniqueUrl,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    required bool? redeemed,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, Object?> json) => _$TicketFromJson(json);
}
