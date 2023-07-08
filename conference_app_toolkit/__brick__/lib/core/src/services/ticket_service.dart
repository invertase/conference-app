import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../configs/firestore_collections.dart';
import '../models/ticket.dart';

class TicketService {
  TicketService(this._firestore);

  final FirebaseFirestore _firestore;
  String host(String projectId) =>
      'https://europe-west3-$projectId.cloudfunctions.net';
  Uri get _baseUrl => Uri.parse(host(_firestore.app.options.projectId));

  Uri _searchTicketUrl(String query) => _baseUrl.replace(
        path: 'searchTicket',
        queryParameters: {'q': query},
      );

  Uri _getTicketUrl(String slug) => _baseUrl.replace(
        path: 'getTicket',
        queryParameters: {'slug': slug},
      );

  Uri _generateBadgeUrl(Ticket ticket) => _baseUrl.replace(
        path: 'generateBadge',
      );

  /// Search for a ticket using email or reference number.
  /// Returns an empty list if no tickets are found.
  ///
  /// [query] must be a valid email, or a valid reference e.g.`ABCD-1`.
  /// In case the query is a reference, only one ticket will be returned.
  ///
  /// Throws [Exception] if the operation fails.
  Future<List<Ticket>> searchTicketByQuery(String query) async {
    final response = await get(_searchTicketUrl(query));

    if (response.statusCode == 200) {
      final List tickets = json.decode(response.body);
      return tickets.map((e) => Ticket.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Failed to search ticket');
    } else {
      throw Exception('Failed to search ticket');
    }
  }

  /// Check if a user has redeemed a ticket using their [uid], and return
  /// the ticket if they have. Returns null if no ticket was found.
  Future<Ticket?> getRedeemedTicket(String uid) async {
    final ticketFromFirestore = await _firestore
        .collection(FirestoreCollections.tickets)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              Ticket.fromJson(snapshot.data()!),
          toFirestore: (value, options) => {},
        )
        .where('uid', isEqualTo: uid)
        .get();

    return ticketFromFirestore.size == 1
        ? ticketFromFirestore.docs.first.data()
        : null;
  }

  Future<Ticket> getTicketById(String id) async {
    final response = await get(_getTicketUrl(id));

    if (response.statusCode == 200) {
      return Ticket.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search ticket');
    }
  }

  /// Link a ticket to a user account.
  Future<void> redeemTicket(User user, Ticket ticket) async {
    try {
      await _firestore
          .doc('${FirestoreCollections.tickets}/${ticket.reference}')
          .set({
        ...ticket.toJson(),
        'uid': user.uid,
        'redeemed': true,
        'redeemedAt': FieldValue.serverTimestamp(),
        'redeemedByUser': user.email,
      });
    } catch (e) {
      rethrow;
    }
  }

  /// Generates a PDF badge link that can be downloaded.
  Future<String?> generateBadge(Ticket ticket) async {
    try {
      final link = _generateBadgeUrl(ticket);
      final response = await post(
        link,
        body: json.encode({
          'ticket': {
            'name': ticket.name,
            'email': ticket.email,
            'slug': ticket.slug,
            'reference': ticket.reference,
            'company_name': ticket.companyName,
            'unique_url': ticket.uniqueUrl,
          }
        }),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body)['url'];
      } else {
        throw HttpException(
          'Failed to generate badge',
          uri: _generateBadgeUrl(ticket),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
