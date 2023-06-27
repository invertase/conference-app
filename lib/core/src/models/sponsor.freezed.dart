// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sponsor _$SponsorFromJson(Map<String, dynamic> json) {
  return _Sponsor.fromJson(json);
}

/// @nodoc
mixin _$Sponsor {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  SponsorLogo get logo => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get contest => throw _privateConstructorUsedError;
  String? get contestLink => throw _privateConstructorUsedError;
  List<dynamic> get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SponsorCopyWith<Sponsor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SponsorCopyWith<$Res> {
  factory $SponsorCopyWith(Sponsor value, $Res Function(Sponsor) then) =
      _$SponsorCopyWithImpl<$Res, Sponsor>;
  @useResult
  $Res call(
      {String id,
      String name,
      int level,
      SponsorLogo logo,
      String? tagline,
      String? about,
      String? contest,
      String? contestLink,
      List<dynamic> links});

  $SponsorLogoCopyWith<$Res> get logo;
}

/// @nodoc
class _$SponsorCopyWithImpl<$Res, $Val extends Sponsor>
    implements $SponsorCopyWith<$Res> {
  _$SponsorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? level = null,
    Object? logo = null,
    Object? tagline = freezed,
    Object? about = freezed,
    Object? contest = freezed,
    Object? contestLink = freezed,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as SponsorLogo,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      contest: freezed == contest
          ? _value.contest
          : contest // ignore: cast_nullable_to_non_nullable
              as String?,
      contestLink: freezed == contestLink
          ? _value.contestLink
          : contestLink // ignore: cast_nullable_to_non_nullable
              as String?,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SponsorLogoCopyWith<$Res> get logo {
    return $SponsorLogoCopyWith<$Res>(_value.logo, (value) {
      return _then(_value.copyWith(logo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SponsorCopyWith<$Res> implements $SponsorCopyWith<$Res> {
  factory _$$_SponsorCopyWith(
          _$_Sponsor value, $Res Function(_$_Sponsor) then) =
      __$$_SponsorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int level,
      SponsorLogo logo,
      String? tagline,
      String? about,
      String? contest,
      String? contestLink,
      List<dynamic> links});

  @override
  $SponsorLogoCopyWith<$Res> get logo;
}

/// @nodoc
class __$$_SponsorCopyWithImpl<$Res>
    extends _$SponsorCopyWithImpl<$Res, _$_Sponsor>
    implements _$$_SponsorCopyWith<$Res> {
  __$$_SponsorCopyWithImpl(_$_Sponsor _value, $Res Function(_$_Sponsor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? level = null,
    Object? logo = null,
    Object? tagline = freezed,
    Object? about = freezed,
    Object? contest = freezed,
    Object? contestLink = freezed,
    Object? links = null,
  }) {
    return _then(_$_Sponsor(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as SponsorLogo,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      contest: freezed == contest
          ? _value.contest
          : contest // ignore: cast_nullable_to_non_nullable
              as String?,
      contestLink: freezed == contestLink
          ? _value.contestLink
          : contestLink // ignore: cast_nullable_to_non_nullable
              as String?,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Sponsor implements _Sponsor {
  const _$_Sponsor(
      {required this.id,
      required this.name,
      required this.level,
      required this.logo,
      this.tagline,
      this.about,
      this.contest,
      this.contestLink,
      final List<dynamic> links = const []})
      : _links = links;

  factory _$_Sponsor.fromJson(Map<String, dynamic> json) =>
      _$$_SponsorFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int level;
  @override
  final SponsorLogo logo;
  @override
  final String? tagline;
  @override
  final String? about;
  @override
  final String? contest;
  @override
  final String? contestLink;
  final List<dynamic> _links;
  @override
  @JsonKey()
  List<dynamic> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'Sponsor(id: $id, name: $name, level: $level, logo: $logo, tagline: $tagline, about: $about, contest: $contest, contestLink: $contestLink, links: $links)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sponsor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.contest, contest) || other.contest == contest) &&
            (identical(other.contestLink, contestLink) ||
                other.contestLink == contestLink) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, level, logo, tagline,
      about, contest, contestLink, const DeepCollectionEquality().hash(_links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SponsorCopyWith<_$_Sponsor> get copyWith =>
      __$$_SponsorCopyWithImpl<_$_Sponsor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SponsorToJson(
      this,
    );
  }
}

abstract class _Sponsor implements Sponsor {
  const factory _Sponsor(
      {required final String id,
      required final String name,
      required final int level,
      required final SponsorLogo logo,
      final String? tagline,
      final String? about,
      final String? contest,
      final String? contestLink,
      final List<dynamic> links}) = _$_Sponsor;

  factory _Sponsor.fromJson(Map<String, dynamic> json) = _$_Sponsor.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get level;
  @override
  SponsorLogo get logo;
  @override
  String? get tagline;
  @override
  String? get about;
  @override
  String? get contest;
  @override
  String? get contestLink;
  @override
  List<dynamic> get links;
  @override
  @JsonKey(ignore: true)
  _$$_SponsorCopyWith<_$_Sponsor> get copyWith =>
      throw _privateConstructorUsedError;
}
