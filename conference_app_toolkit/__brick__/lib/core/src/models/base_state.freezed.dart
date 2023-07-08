// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T> value)? data,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
          BaseState<T> value, $Res Function(BaseState<T>) then) =
      _$BaseStateCopyWithImpl<T, $Res, BaseState<T>>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res, $Val extends BaseState<T>>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DataCopyWith<T, $Res> {
  factory _$$_DataCopyWith(_$_Data<T> value, $Res Function(_$_Data<T>) then) =
      __$$_DataCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$_DataCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_Data<T>>
    implements _$$_DataCopyWith<T, $Res> {
  __$$_DataCopyWithImpl(_$_Data<T> _value, $Res Function(_$_Data<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_Data<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Data<T> implements _Data<T> {
  const _$_Data({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'BaseState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<T, _$_Data<T>> get copyWith =>
      __$$_DataCopyWithImpl<T, _$_Data<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Error<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Error<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T> value)? data,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data<T> implements BaseState<T> {
  const factory _Data({required final T data}) = _$_Data<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$_DataCopyWith<T, _$_Data<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<T, $Res> {
  factory _$$_EmptyCopyWith(
          _$_Empty<T> value, $Res Function(_$_Empty<T>) then) =
      __$$_EmptyCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_Empty<T>>
    implements _$$_EmptyCopyWith<T, $Res> {
  __$$_EmptyCopyWithImpl(_$_Empty<T> _value, $Res Function(_$_Empty<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Empty<T> implements _Empty<T> {
  const _$_Empty();

  @override
  String toString() {
    return 'BaseState<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Error<T> value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Error<T> value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T> value)? data,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> implements BaseState<T> {
  const factory _Empty() = _$_Empty<T>;
}

/// @nodoc
abstract class _$$_InitialCopyWith<T, $Res> {
  factory _$$_InitialCopyWith(
          _$_Initial<T> value, $Res Function(_$_Initial<T>) then) =
      __$$_InitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_Initial<T>>
    implements _$$_InitialCopyWith<T, $Res> {
  __$$_InitialCopyWithImpl(
      _$_Initial<T> _value, $Res Function(_$_Initial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial<T> implements _Initial<T> {
  const _$_Initial();

  @override
  String toString() {
    return 'BaseState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T> value)? data,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements BaseState<T> {
  const factory _Initial() = _$_Initial<T>;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<T, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<T> value, $Res Function(_$_Loading<T>) then) =
      __$$_LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_Loading<T>>
    implements _$$_LoadingCopyWith<T, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<T> _value, $Res Function(_$_Loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading<T> implements _Loading<T> {
  const _$_Loading();

  @override
  String toString() {
    return 'BaseState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T> value)? data,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements BaseState<T> {
  const factory _Loading() = _$_Loading<T>;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<T, $Res> {
  factory _$$_ErrorCopyWith(
          _$_Error<T> value, $Res Function(_$_Error<T>) then) =
      __$$_ErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_Error<T>>
    implements _$$_ErrorCopyWith<T, $Res> {
  __$$_ErrorCopyWithImpl(_$_Error<T> _value, $Res Function(_$_Error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Error<T>(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Error<T> implements _Error<T> {
  const _$_Error([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'BaseState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      __$$_ErrorCopyWithImpl<T, _$_Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? data,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data<T> value)? data,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T> value)? data,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T> implements BaseState<T> {
  const factory _Error([final String? message]) = _$_Error<T>;

  String? get message;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
