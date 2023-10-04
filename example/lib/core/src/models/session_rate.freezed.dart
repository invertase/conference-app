// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionRate _$SessionRateFromJson(Map<String, dynamic> json) {
  return _SessionRate.fromJson(json);
}

/// @nodoc
mixin _$SessionRate {
  String get ticketReference => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionRateCopyWith<SessionRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionRateCopyWith<$Res> {
  factory $SessionRateCopyWith(
          SessionRate value, $Res Function(SessionRate) then) =
      _$SessionRateCopyWithImpl<$Res, SessionRate>;
  @useResult
  $Res call(
      {String ticketReference, String sessionId, double rate, String? review});
}

/// @nodoc
class _$SessionRateCopyWithImpl<$Res, $Val extends SessionRate>
    implements $SessionRateCopyWith<$Res> {
  _$SessionRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketReference = null,
    Object? sessionId = null,
    Object? rate = null,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      ticketReference: null == ticketReference
          ? _value.ticketReference
          : ticketReference // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionRateCopyWith<$Res>
    implements $SessionRateCopyWith<$Res> {
  factory _$$_SessionRateCopyWith(
          _$_SessionRate value, $Res Function(_$_SessionRate) then) =
      __$$_SessionRateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ticketReference, String sessionId, double rate, String? review});
}

/// @nodoc
class __$$_SessionRateCopyWithImpl<$Res>
    extends _$SessionRateCopyWithImpl<$Res, _$_SessionRate>
    implements _$$_SessionRateCopyWith<$Res> {
  __$$_SessionRateCopyWithImpl(
      _$_SessionRate _value, $Res Function(_$_SessionRate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketReference = null,
    Object? sessionId = null,
    Object? rate = null,
    Object? review = freezed,
  }) {
    return _then(_$_SessionRate(
      ticketReference: null == ticketReference
          ? _value.ticketReference
          : ticketReference // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SessionRate implements _SessionRate {
  const _$_SessionRate(
      {required this.ticketReference,
      required this.sessionId,
      required this.rate,
      this.review});

  factory _$_SessionRate.fromJson(Map<String, dynamic> json) =>
      _$$_SessionRateFromJson(json);

  @override
  final String ticketReference;
  @override
  final String sessionId;
  @override
  final double rate;
  @override
  final String? review;

  @override
  String toString() {
    return 'SessionRate(ticketReference: $ticketReference, sessionId: $sessionId, rate: $rate, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionRate &&
            (identical(other.ticketReference, ticketReference) ||
                other.ticketReference == ticketReference) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ticketReference, sessionId, rate, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionRateCopyWith<_$_SessionRate> get copyWith =>
      __$$_SessionRateCopyWithImpl<_$_SessionRate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionRateToJson(
      this,
    );
  }
}

abstract class _SessionRate implements SessionRate {
  const factory _SessionRate(
      {required final String ticketReference,
      required final String sessionId,
      required final double rate,
      final String? review}) = _$_SessionRate;

  factory _SessionRate.fromJson(Map<String, dynamic> json) =
      _$_SessionRate.fromJson;

  @override
  String get ticketReference;
  @override
  String get sessionId;
  @override
  double get rate;
  @override
  String? get review;
  @override
  @JsonKey(ignore: true)
  _$$_SessionRateCopyWith<_$_SessionRate> get copyWith =>
      throw _privateConstructorUsedError;
}
