import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../providers/auth_provider.dart';
import '../providers/ticket_provider.dart';
import '../widgets/animated_ticket_switcher.dart';
import '../widgets/error_banner.dart';
import '../widgets/ticket_widget.dart';
import '../widgets/tickets_picker.dart';

class TicketPage extends ConsumerStatefulWidget {
  const TicketPage({super.key});

  @override
  ConsumerState<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends ConsumerState<TicketPage>
    with AutomaticKeepAliveClientMixin {
  String? email;
  String? password;
  bool _loading = false;
  String? errorMessage;

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.addListener(focusListener);
    super.initState();
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.removeListener(focusListener);
    super.dispose();
  }

  void focusListener() {
    setState(() {
      errorMessage = null;
    });
  }

  set loading(bool value) {
    setState(() {
      _loading = value;
    });
  }

  bool get enableSignupButton =>
      _loading == false &&
      (email != null || (email?.isNotEmpty ?? false)) &&
      (password != null || (password?.isNotEmpty ?? false));

  void signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    loading = true;
    setState(() {
      errorMessage = null;
    });

    try {
      await ref
          .watch(authService)
          .signUpWithEmailAndPassword(email!, password!);
      setState(() {
        email = null;
        password = null;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      HapticFeedback.heavyImpact();
      log(e.toString());
    } finally {
      loading = false;
    }
  }

  void redeemTicket(Ticket ticket, User user) async {
    loading = true;

    try {
      await ref.watch(ticketService).redeemTicket(user, ticket);
      ref.invalidate(ticketProvider);
    } catch (e) {
      setState(() {
        errorMessage = errorMessage = AppStrings.ticketAlreadyRedeemed
            .replaceAll('{{email}}', AppStrings.appAuthorEmail);
      });
    }

    loading = false;
  }

  void downloadBadge(Ticket ticket) async {
    loading = true;

    try {
      final link = await ref.watch(ticketService).generateBadge(ticket);
      loading = false;

      if (link != null) {
        launchUrlString(link, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      loading = false;

      setState(() {
        errorMessage = AppStrings.ticketAlreadyRedeemed
            .replaceAll('{{email}}', AppStrings.appAuthorEmail);
      });
    }
  }

  void queryTicketByReference(String reference, User user) async {
    FocusManager.instance.primaryFocus?.unfocus();

    loading = true;

    try {
      final tickets =
          await ref.watch(ticketService).searchTicketByQuery(reference);

      if (tickets.isNotEmpty) {
        redeemTicket(tickets.first, user);
      }
    } catch (e) {
      setState(() {
        errorMessage = 'No ticket found for this reference';
      });
    }

    loading = false;
  }

  void signOut() {
    FocusManager.instance.primaryFocus?.unfocus();

    ref.watch(authService).signOut();
  }

  bool hasRedeemedTicket(List<Ticket>? tickets) {
    return tickets?.length == 1 && (tickets?.first.redeemed ?? false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top,
              child: ErrorBanner(
                message: errorMessage,
                clearMessage: () {
                  setState(() {
                    errorMessage = null;
                  });
                },
              ),
            ),
            AnimatedTicketSwitcher(
              child: ref.watch(authStateProvider).when(
                    error: (error, s) => Container(),
                    loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    data: (user) => user != null
                        ? AnimatedTicketSwitcher(
                            child: ref.watch(ticketProvider).when<Widget>(
                                  loading: () => const FetchingTicket(),
                                  error: (error, s) => Center(
                                    child: Text('Error: $error'),
                                  ),
                                  // The user has a ticket or multiple tickets.
                                  data: (data) {
                                    return Center(
                                      child: hasRedeemedTicket(data)
                                          ? Stack(
                                              children: [
                                                TicketWidget(
                                                  ticket: data!.first,
                                                  onSignOut: signOut,
                                                  onGenerateBadge: () =>
                                                      downloadBadge(data.first),
                                                ),
                                                LoadingOverlay(show: _loading)
                                              ],
                                            )
                                          : TicketsPicker(
                                              email: user.email!,
                                              tickets: data as List<Ticket>,
                                              onSignOut: signOut,
                                              selectedTicket: (ticket) {
                                                redeemTicket(ticket, user);
                                              },
                                              referenceTicket: _loading
                                                  ? null
                                                  : (reference) {
                                                      queryTicketByReference(
                                                          reference, user);
                                                    },
                                            ),
                                    );
                                  },
                                ),
                          )
                        : Center(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewPadding.bottom,
                              ),
                              child: TicketWidget(
                                email: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                password: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                onSignUp: enableSignupButton ? signUp : null,
                              ),
                            ),
                          ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class FetchingTicket extends StatelessWidget {
  const FetchingTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Fetching your ticket...'),
          SizedBox(height: 10),
          CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
