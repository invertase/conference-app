import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:conference_app/core/core.dart';

import 'auth_provider.dart';

final ticketService =
    Provider<TicketService>((ref) => TicketService(FirebaseFirestore.instance));

final ticketProvider = FutureProvider.autoDispose<List<Ticket>?>((ref) async {
  List<Ticket> tickets = [];

  final user = ref.watch(userProvider);

  // If there's a signed in user, see if they have redeemed a ticket.
  if (user != null) {
    final ticket = await ref.watch(ticketService).getRedeemedTicket(user.uid);

    if (ticket != null) {
      return [ticket];
    } else {
      // No tickets were redeemed.
      final ticketsFromApi = await ref
          .read(ticketService)
          .searchTicketByQuery(ref.watch(authStateProvider).value!.email!);

      if (ticketsFromApi.isNotEmpty) {
        return ticketsFromApi;
      }
    }
  }

  return tickets;
});

/// A shorthand to get the current ticket.
final currentTicket = StateProvider.autoDispose<Ticket?>(
  (ref) => ref.watch(ticketProvider).value?.length == 1
      ? ref.watch(ticketProvider).value!.first
      : null,
);
