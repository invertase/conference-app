import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/base_state.dart';

class BaseStateNotifierProvider<T extends Object>
    extends StateNotifier<BaseState<T>> {
  BaseStateNotifierProvider() : super(const BaseState.initial());

  void setErrorState(String error) {
    debugPrint(error);
    state = BaseState<T>.error(error);
  }

  void setLoadingState() {
    state = BaseState<T>.loading();
  }

  void setInitialState() {
    state = BaseState<T>.initial();
  }

  void setLoadedState(T data) {
    state = BaseState<T>.data(data: data);
  }

  void setEmptyState() {
    state = BaseState<T>.empty();
  }
}
