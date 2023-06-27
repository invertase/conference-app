// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  int get id => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_url')
  String get qr => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'unique_url')
  String? get uniqueUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  bool? get redeemed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {int id,
      String? slug,
      String reference,
      @JsonKey(name: 'qr_url') String qr,
      String name,
      String email,
      @JsonKey(name: 'company_name') String? companyName,
      @JsonKey(name: 'unique_url') String? uniqueUrl,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      bool? redeemed});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = freezed,
    Object? reference = null,
    Object? qr = null,
    Object? name = null,
    Object? email = null,
    Object? companyName = freezed,
    Object? uniqueUrl = freezed,
    Object? avatarUrl = null,
    Object? redeemed = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueUrl: freezed == uniqueUrl
          ? _value.uniqueUrl
          : uniqueUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      redeemed: freezed == redeemed
          ? _value.redeemed
          : redeemed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$_TicketCopyWith(_$_Ticket value, $Res Function(_$_Ticket) then) =
      __$$_TicketCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? slug,
      String reference,
      @JsonKey(name: 'qr_url') String qr,
      String name,
      String email,
      @JsonKey(name: 'company_name') String? companyName,
      @JsonKey(name: 'unique_url') String? uniqueUrl,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      bool? redeemed});
}

/// @nodoc
class __$$_TicketCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$_Ticket>
    implements _$$_TicketCopyWith<$Res> {
  __$$_TicketCopyWithImpl(_$_Ticket _value, $Res Function(_$_Ticket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = freezed,
    Object? reference = null,
    Object? qr = null,
    Object? name = null,
    Object? email = null,
    Object? companyName = freezed,
    Object? uniqueUrl = freezed,
    Object? avatarUrl = null,
    Object? redeemed = freezed,
  }) {
    return _then(_$_Ticket(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueUrl: freezed == uniqueUrl
          ? _value.uniqueUrl
          : uniqueUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      redeemed: freezed == redeemed
          ? _value.redeemed
          : redeemed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ticket implements _Ticket {
  const _$_Ticket(
      {required this.id,
      required this.slug,
      required this.reference,
      @JsonKey(name: 'qr_url') required this.qr,
      required this.name,
      required this.email,
      @JsonKey(name: 'company_name') this.companyName,
      @JsonKey(name: 'unique_url') this.uniqueUrl,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      required this.redeemed});

  factory _$_Ticket.fromJson(Map<String, dynamic> json) =>
      _$$_TicketFromJson(json);

  @override
  final int id;
  @override
  final String? slug;
  @override
  final String reference;
  @override
  @JsonKey(name: 'qr_url')
  final String qr;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  @JsonKey(name: 'unique_url')
  final String? uniqueUrl;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  final bool? redeemed;

  @override
  String toString() {
    return 'Ticket(id: $id, slug: $slug, reference: $reference, qr: $qr, name: $name, email: $email, companyName: $companyName, uniqueUrl: $uniqueUrl, avatarUrl: $avatarUrl, redeemed: $redeemed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ticket &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.qr, qr) || other.qr == qr) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.uniqueUrl, uniqueUrl) ||
                other.uniqueUrl == uniqueUrl) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.redeemed, redeemed) ||
                other.redeemed == redeemed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, slug, reference, qr, name,
      email, companyName, uniqueUrl, avatarUrl, redeemed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      __$$_TicketCopyWithImpl<_$_Ticket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {required final int id,
      required final String? slug,
      required final String reference,
      @JsonKey(name: 'qr_url') required final String qr,
      required final String name,
      required final String email,
      @JsonKey(name: 'company_name') final String? companyName,
      @JsonKey(name: 'unique_url') final String? uniqueUrl,
      @JsonKey(name: 'avatar_url') required final String avatarUrl,
      required final bool? redeemed}) = _$_Ticket;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$_Ticket.fromJson;

  @override
  int get id;
  @override
  String? get slug;
  @override
  String get reference;
  @override
  @JsonKey(name: 'qr_url')
  String get qr;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  @JsonKey(name: 'unique_url')
  String? get uniqueUrl;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  bool? get redeemed;
  @override
  @JsonKey(ignore: true)
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      throw _privateConstructorUsedError;
}
