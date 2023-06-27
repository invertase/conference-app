// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get roomId => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: SessionStatus.upcoming)
  SessionStatus get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: convertTimestamnpToDateTime)
  DateTime get startsAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: convertTimestamnpToDateTime)
  DateTime get endsAt => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isServiceSession => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isPlenumSession => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<dynamic> get speakers => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<dynamic> get categoryItems => throw _privateConstructorUsedError;
  @JsonKey()
  String? get liveUrl => throw _privateConstructorUsedError;
  @JsonKey()
  String? get recordingUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      int roomId,
      @JsonKey(defaultValue: SessionStatus.upcoming) SessionStatus status,
      @JsonKey(fromJson: convertTimestamnpToDateTime) DateTime startsAt,
      @JsonKey(fromJson: convertTimestamnpToDateTime) DateTime endsAt,
      @JsonKey(defaultValue: false) bool isServiceSession,
      @JsonKey(defaultValue: false) bool isPlenumSession,
      @JsonKey(defaultValue: []) List<dynamic> speakers,
      @JsonKey(defaultValue: []) List<dynamic> categoryItems,
      @JsonKey() String? liveUrl,
      @JsonKey() String? recordingUrl});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? roomId = null,
    Object? status = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? isServiceSession = null,
    Object? isPlenumSession = null,
    Object? speakers = null,
    Object? categoryItems = null,
    Object? liveUrl = freezed,
    Object? recordingUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isServiceSession: null == isServiceSession
          ? _value.isServiceSession
          : isServiceSession // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlenumSession: null == isPlenumSession
          ? _value.isPlenumSession
          : isPlenumSession // ignore: cast_nullable_to_non_nullable
              as bool,
      speakers: null == speakers
          ? _value.speakers
          : speakers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      categoryItems: null == categoryItems
          ? _value.categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      liveUrl: freezed == liveUrl
          ? _value.liveUrl
          : liveUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingUrl: freezed == recordingUrl
          ? _value.recordingUrl
          : recordingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$_SessionCopyWith(
          _$_Session value, $Res Function(_$_Session) then) =
      __$$_SessionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      int roomId,
      @JsonKey(defaultValue: SessionStatus.upcoming) SessionStatus status,
      @JsonKey(fromJson: convertTimestamnpToDateTime) DateTime startsAt,
      @JsonKey(fromJson: convertTimestamnpToDateTime) DateTime endsAt,
      @JsonKey(defaultValue: false) bool isServiceSession,
      @JsonKey(defaultValue: false) bool isPlenumSession,
      @JsonKey(defaultValue: []) List<dynamic> speakers,
      @JsonKey(defaultValue: []) List<dynamic> categoryItems,
      @JsonKey() String? liveUrl,
      @JsonKey() String? recordingUrl});
}

/// @nodoc
class __$$_SessionCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$_Session>
    implements _$$_SessionCopyWith<$Res> {
  __$$_SessionCopyWithImpl(_$_Session _value, $Res Function(_$_Session) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? roomId = null,
    Object? status = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? isServiceSession = null,
    Object? isPlenumSession = null,
    Object? speakers = null,
    Object? categoryItems = null,
    Object? liveUrl = freezed,
    Object? recordingUrl = freezed,
  }) {
    return _then(_$_Session(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isServiceSession: null == isServiceSession
          ? _value.isServiceSession
          : isServiceSession // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlenumSession: null == isPlenumSession
          ? _value.isPlenumSession
          : isPlenumSession // ignore: cast_nullable_to_non_nullable
              as bool,
      speakers: null == speakers
          ? _value._speakers
          : speakers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      categoryItems: null == categoryItems
          ? _value._categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      liveUrl: freezed == liveUrl
          ? _value.liveUrl
          : liveUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingUrl: freezed == recordingUrl
          ? _value.recordingUrl
          : recordingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Session implements _Session {
  const _$_Session(
      {required this.id,
      required this.title,
      required this.description,
      required this.roomId,
      @JsonKey(defaultValue: SessionStatus.upcoming) required this.status,
      @JsonKey(fromJson: convertTimestamnpToDateTime) required this.startsAt,
      @JsonKey(fromJson: convertTimestamnpToDateTime) required this.endsAt,
      @JsonKey(defaultValue: false) required this.isServiceSession,
      @JsonKey(defaultValue: false) required this.isPlenumSession,
      @JsonKey(defaultValue: []) required final List<dynamic> speakers,
      @JsonKey(defaultValue: []) required final List<dynamic> categoryItems,
      @JsonKey() this.liveUrl,
      @JsonKey() this.recordingUrl})
      : _speakers = speakers,
        _categoryItems = categoryItems;

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$$_SessionFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final int roomId;
  @override
  @JsonKey(defaultValue: SessionStatus.upcoming)
  final SessionStatus status;
  @override
  @JsonKey(fromJson: convertTimestamnpToDateTime)
  final DateTime startsAt;
  @override
  @JsonKey(fromJson: convertTimestamnpToDateTime)
  final DateTime endsAt;
  @override
  @JsonKey(defaultValue: false)
  final bool isServiceSession;
  @override
  @JsonKey(defaultValue: false)
  final bool isPlenumSession;
  final List<dynamic> _speakers;
  @override
  @JsonKey(defaultValue: [])
  List<dynamic> get speakers {
    if (_speakers is EqualUnmodifiableListView) return _speakers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_speakers);
  }

  final List<dynamic> _categoryItems;
  @override
  @JsonKey(defaultValue: [])
  List<dynamic> get categoryItems {
    if (_categoryItems is EqualUnmodifiableListView) return _categoryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryItems);
  }

  @override
  @JsonKey()
  final String? liveUrl;
  @override
  @JsonKey()
  final String? recordingUrl;

  @override
  String toString() {
    return 'Session(id: $id, title: $title, description: $description, roomId: $roomId, status: $status, startsAt: $startsAt, endsAt: $endsAt, isServiceSession: $isServiceSession, isPlenumSession: $isPlenumSession, speakers: $speakers, categoryItems: $categoryItems, liveUrl: $liveUrl, recordingUrl: $recordingUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Session &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.isServiceSession, isServiceSession) ||
                other.isServiceSession == isServiceSession) &&
            (identical(other.isPlenumSession, isPlenumSession) ||
                other.isPlenumSession == isPlenumSession) &&
            const DeepCollectionEquality().equals(other._speakers, _speakers) &&
            const DeepCollectionEquality()
                .equals(other._categoryItems, _categoryItems) &&
            (identical(other.liveUrl, liveUrl) || other.liveUrl == liveUrl) &&
            (identical(other.recordingUrl, recordingUrl) ||
                other.recordingUrl == recordingUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      roomId,
      status,
      startsAt,
      endsAt,
      isServiceSession,
      isPlenumSession,
      const DeepCollectionEquality().hash(_speakers),
      const DeepCollectionEquality().hash(_categoryItems),
      liveUrl,
      recordingUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      __$$_SessionCopyWithImpl<_$_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  const factory _Session(
      {required final String id,
      required final String title,
      required final String? description,
      required final int roomId,
      @JsonKey(defaultValue: SessionStatus.upcoming)
          required final SessionStatus status,
      @JsonKey(fromJson: convertTimestamnpToDateTime)
          required final DateTime startsAt,
      @JsonKey(fromJson: convertTimestamnpToDateTime)
          required final DateTime endsAt,
      @JsonKey(defaultValue: false)
          required final bool isServiceSession,
      @JsonKey(defaultValue: false)
          required final bool isPlenumSession,
      @JsonKey(defaultValue: [])
          required final List<dynamic> speakers,
      @JsonKey(defaultValue: [])
          required final List<dynamic> categoryItems,
      @JsonKey()
          final String? liveUrl,
      @JsonKey()
          final String? recordingUrl}) = _$_Session;

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  int get roomId;
  @override
  @JsonKey(defaultValue: SessionStatus.upcoming)
  SessionStatus get status;
  @override
  @JsonKey(fromJson: convertTimestamnpToDateTime)
  DateTime get startsAt;
  @override
  @JsonKey(fromJson: convertTimestamnpToDateTime)
  DateTime get endsAt;
  @override
  @JsonKey(defaultValue: false)
  bool get isServiceSession;
  @override
  @JsonKey(defaultValue: false)
  bool get isPlenumSession;
  @override
  @JsonKey(defaultValue: [])
  List<dynamic> get speakers;
  @override
  @JsonKey(defaultValue: [])
  List<dynamic> get categoryItems;
  @override
  @JsonKey()
  String? get liveUrl;
  @override
  @JsonKey()
  String? get recordingUrl;
  @override
  @JsonKey(ignore: true)
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
