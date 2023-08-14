import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

extension BaseStateGetters on BaseState {
  bool get isLoading => this is _Loading;
  bool get isEmpty => this is _Empty;
  bool get hasError => this is _Error;
}

@freezed
class BaseState<T> with _$BaseState {
  /// Data is present state
  const factory BaseState.data({required T data}) = _Data;

  /// Data is empty, no data where found
  const factory BaseState.empty() = _Empty;

  /// Initial/default state
  const factory BaseState.initial() = _Initial;

  /// Data is loading state
  const factory BaseState.loading() = _Loading;

  /// Error when loading data state
  const factory BaseState.error([String? message]) = _Error;
}
