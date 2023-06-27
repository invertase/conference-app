// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      id: json['id'] as int,
      slug: json['slug'] as String?,
      reference: json['reference'] as String,
      qr: json['qr_url'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      companyName: json['company_name'] as String?,
      uniqueUrl: json['unique_url'] as String?,
      avatarUrl: json['avatar_url'] as String,
      redeemed: json['redeemed'] as bool?,
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'reference': instance.reference,
      'qr_url': instance.qr,
      'name': instance.name,
      'email': instance.email,
      'company_name': instance.companyName,
      'unique_url': instance.uniqueUrl,
      'avatar_url': instance.avatarUrl,
      'redeemed': instance.redeemed,
    };
