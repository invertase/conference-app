// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  Map<String, dynamic> get notification => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  NotificationAction get action => throw _privateConstructorUsedError;
  NotificationScreen get screen => throw _privateConstructorUsedError;
  bool get isForground => throw _privateConstructorUsedError;
  @JsonKey(fromJson: sentTimeFromJson)
  DateTime? get sentTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {Map<String, dynamic> notification,
      Map<String, dynamic> data,
      NotificationAction action,
      NotificationScreen screen,
      bool isForground,
      @JsonKey(fromJson: sentTimeFromJson) DateTime? sentTime});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? data = null,
    Object? action = null,
    Object? screen = null,
    Object? isForground = null,
    Object? sentTime = freezed,
  }) {
    return _then(_value.copyWith(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as NotificationAction,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as NotificationScreen,
      isForground: null == isForground
          ? _value.isForground
          : isForground // ignore: cast_nullable_to_non_nullable
              as bool,
      sentTime: freezed == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$_NotificationCopyWith(
          _$_Notification value, $Res Function(_$_Notification) then) =
      __$$_NotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> notification,
      Map<String, dynamic> data,
      NotificationAction action,
      NotificationScreen screen,
      bool isForground,
      @JsonKey(fromJson: sentTimeFromJson) DateTime? sentTime});
}

/// @nodoc
class __$$_NotificationCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$_Notification>
    implements _$$_NotificationCopyWith<$Res> {
  __$$_NotificationCopyWithImpl(
      _$_Notification _value, $Res Function(_$_Notification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? data = null,
    Object? action = null,
    Object? screen = null,
    Object? isForground = null,
    Object? sentTime = freezed,
  }) {
    return _then(_$_Notification(
      notification: null == notification
          ? _value._notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as NotificationAction,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as NotificationScreen,
      isForground: null == isForground
          ? _value.isForground
          : isForground // ignore: cast_nullable_to_non_nullable
              as bool,
      sentTime: freezed == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Notification implements _Notification {
  const _$_Notification(
      {required final Map<String, dynamic> notification,
      required final Map<String, dynamic> data,
      this.action = NotificationAction.unknown,
      this.screen = NotificationScreen.unknown,
      this.isForground = false,
      @JsonKey(fromJson: sentTimeFromJson) this.sentTime})
      : _notification = notification,
        _data = data;

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  final Map<String, dynamic> _notification;
  @override
  Map<String, dynamic> get notification {
    if (_notification is EqualUnmodifiableMapView) return _notification;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notification);
  }

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey()
  final NotificationAction action;
  @override
  @JsonKey()
  final NotificationScreen screen;
  @override
  @JsonKey()
  final bool isForground;
  @override
  @JsonKey(fromJson: sentTimeFromJson)
  final DateTime? sentTime;

  @override
  String toString() {
    return 'Notification(notification: $notification, data: $data, action: $action, screen: $screen, isForground: $isForground, sentTime: $sentTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notification &&
            const DeepCollectionEquality()
                .equals(other._notification, _notification) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.isForground, isForground) ||
                other.isForground == isForground) &&
            (identical(other.sentTime, sentTime) ||
                other.sentTime == sentTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notification),
      const DeepCollectionEquality().hash(_data),
      action,
      screen,
      isForground,
      sentTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      __$$_NotificationCopyWithImpl<_$_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
          {required final Map<String, dynamic> notification,
          required final Map<String, dynamic> data,
          final NotificationAction action,
          final NotificationScreen screen,
          final bool isForground,
          @JsonKey(fromJson: sentTimeFromJson) final DateTime? sentTime}) =
      _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override
  Map<String, dynamic> get notification;
  @override
  Map<String, dynamic> get data;
  @override
  NotificationAction get action;
  @override
  NotificationScreen get screen;
  @override
  bool get isForground;
  @override
  @JsonKey(fromJson: sentTimeFromJson)
  DateTime? get sentTime;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
