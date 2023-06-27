import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/base_state.dart';
import '../models/session.dart';
import 'base_state_notifier_provider.dart';
import 'local_storage_provider.dart';
import 'messaging_provider.dart';
import 'sessions_provider.dart';

typedef MyAgendaState = Map<String, List<Session>>;

final myAgenda =
    StateNotifierProvider<MyAgendaProvider, BaseState<MyAgendaState>>((ref) {
  return MyAgendaProvider(ref);
});

class MyAgendaProvider extends BaseStateNotifierProvider<MyAgendaState> {
  MyAgendaProvider(this.ref) {
    _refreshMyAgenda();
  }

  final Ref ref;
  final myAgenda = <String, List<Session>>{};

  void _refreshMyAgenda() {
    setLoadingState();

    ref.watch(sessionsProvider).when(
      data: (sessions) {
        final agendaFromStrorage =
            ref.watch(localStorage).get('myAgenda') ?? [];
        final List<Session> myAgenda = agendaFromStrorage
            .map((e) => sessions.singleWhere((s) => s.id == e))
            .toList()
            .cast<Session>();

        myAgenda.sort((a, b) => a.startsAt.compareTo(b.startsAt));

        if (myAgenda.isEmpty) {
          setEmptyState();
        } else {
          setLoadedState(
            groupBy(myAgenda, (session) => session.roomId.toString()),
          );
        }
      },
      error: (error, stackTrace) {
        setErrorState('$error');
      },
      loading: () {
        setLoadingState();
      },
    );
  }

  Future<void> remove(Session session) async {
    final my = (ref.read(localStorage).get('myAgenda') as List<String>?) ?? [];
    if (my.contains(session.id)) {
      my.remove(session.id);
      ref.watch(localStorage).set('myAgenda', my);
    }

    ref.watch(messagingService).unsubscribeFromTopic(session.id);
    _refreshMyAgenda();
  }

  Future<void> add(Session session) async {
    final my = (ref.read(localStorage).get('myAgenda') as List<String>?) ?? [];
    if (!my.contains(session.id)) {
      ref.watch(localStorage).set('myAgenda', my..add(session.id));
    }

    ref.watch(messagingService).subscribeToTopic(session.id);
    _refreshMyAgenda();
  }
}

/// The number of sessions added to the user's local storage.
final myAgendaLength = StateProvider<int>((ref) {
  return ref.watch(myAgenda).map<int>(
        data: (myAgenda) => (myAgenda.data as Map<String, List<Session>>)
            .values
            .expand((element) => element)
            .length,
        empty: (_) => 0,
        initial: (_) => 0,
        loading: (_) => 0,
        error: (_) => 0,
      );
});

/// Returns [true] if the session is in My Agenda local storage, [false] otherwise.
final isAddedToMyAgenda = StateProvider.family<bool, Session>((ref, session) {
  return ref.watch(myAgenda).map<bool>(
        data: (myAgenda) => (myAgenda.data as Map<String, List<Session>>)
            .values
            .expand((element) => element)
            .contains(session),
        empty: (_) => false,
        initial: (_) => false,
        loading: (_) => false,
        error: (_) => false,
      );
});
