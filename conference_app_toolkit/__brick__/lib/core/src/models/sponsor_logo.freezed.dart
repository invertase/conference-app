// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_logo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SponsorLogo _$SponsorLogoFromJson(Map<String, dynamic> json) {
  return _SponsorLogo.fromJson(json);
}

/// @nodoc
mixin _$SponsorLogo {
  String get normal => throw _privateConstructorUsedError;
  String? get dark => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SponsorLogoCopyWith<SponsorLogo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SponsorLogoCopyWith<$Res> {
  factory $SponsorLogoCopyWith(
          SponsorLogo value, $Res Function(SponsorLogo) then) =
      _$SponsorLogoCopyWithImpl<$Res, SponsorLogo>;
  @useResult
  $Res call({String normal, String? dark});
}

/// @nodoc
class _$SponsorLogoCopyWithImpl<$Res, $Val extends SponsorLogo>
    implements $SponsorLogoCopyWith<$Res> {
  _$SponsorLogoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normal = null,
    Object? dark = freezed,
  }) {
    return _then(_value.copyWith(
      normal: null == normal
          ? _value.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as String,
      dark: freezed == dark
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SponsorLogoCopyWith<$Res>
    implements $SponsorLogoCopyWith<$Res> {
  factory _$$_SponsorLogoCopyWith(
          _$_SponsorLogo value, $Res Function(_$_SponsorLogo) then) =
      __$$_SponsorLogoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String normal, String? dark});
}

/// @nodoc
class __$$_SponsorLogoCopyWithImpl<$Res>
    extends _$SponsorLogoCopyWithImpl<$Res, _$_SponsorLogo>
    implements _$$_SponsorLogoCopyWith<$Res> {
  __$$_SponsorLogoCopyWithImpl(
      _$_SponsorLogo _value, $Res Function(_$_SponsorLogo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normal = null,
    Object? dark = freezed,
  }) {
    return _then(_$_SponsorLogo(
      normal: null == normal
          ? _value.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as String,
      dark: freezed == dark
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SponsorLogo implements _SponsorLogo {
  const _$_SponsorLogo({required this.normal, this.dark});

  factory _$_SponsorLogo.fromJson(Map<String, dynamic> json) =>
      _$$_SponsorLogoFromJson(json);

  @override
  final String normal;
  @override
  final String? dark;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SponsorLogo &&
            (identical(other.normal, normal) || other.normal == normal) &&
            (identical(other.dark, dark) || other.dark == dark));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, normal, dark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SponsorLogoCopyWith<_$_SponsorLogo> get copyWith =>
      __$$_SponsorLogoCopyWithImpl<_$_SponsorLogo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SponsorLogoToJson(
      this,
    );
  }
}

abstract class _SponsorLogo implements SponsorLogo {
  const factory _SponsorLogo(
      {required final String normal, final String? dark}) = _$_SponsorLogo;

  factory _SponsorLogo.fromJson(Map<String, dynamic> json) =
      _$_SponsorLogo.fromJson;

  @override
  String get normal;
  @override
  String? get dark;
  @override
  @JsonKey(ignore: true)
  _$$_SponsorLogoCopyWith<_$_SponsorLogo> get copyWith =>
      throw _privateConstructorUsedError;
}
