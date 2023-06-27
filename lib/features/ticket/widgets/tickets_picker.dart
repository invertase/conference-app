import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';

import '../providers/auth_provider.dart';
import 'animated_ticket_switcher.dart';
import 'verify_email.dart';

class TicketsPicker extends ConsumerStatefulWidget {
  const TicketsPicker({
    super.key,
    required this.email,
    required this.tickets,
    required this.onSignOut,
    required this.selectedTicket,
    required this.referenceTicket,
  });

  final String email;
  final List<Ticket> tickets;
  final ValueChanged<Ticket> selectedTicket;
  final ValueChanged<String>? referenceTicket;
  final VoidCallback? onSignOut;

  @override
  ConsumerState<TicketsPicker> createState() => _TicketsPickerState();
}

class _TicketsPickerState extends ConsumerState<TicketsPicker> {
  String reference = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: AnimatedTicketSwitcher(
          child: !(ref.refresh(userInstanceProvider)?.emailVerified ?? false)
              ? VerifyEmail(
                  email: ref.refresh(userInstanceProvider)!.email!,
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome ${widget.email}',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Let\'s redeem your ticket!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 50),
                      SkewedContainer(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.tickets.isNotEmpty)
                                Column(
                                  children: [
                                    Text(
                                      'We found ${widget.tickets.length} tickets for your email, '
                                      'in order to redeem, please select one of them.',
                                    ),
                                    const SizedBox(height: 20),
                                    for (final ticket in widget.tickets)
                                      AppAdaptiveTextButton(
                                        child: Row(
                                          children: [
                                            const Icon(
                                                Icons.local_activity_rounded),
                                            const SizedBox(width: 20),
                                            Text(ticket.reference),
                                          ],
                                        ),
                                        onPressed: () =>
                                            widget.selectedTicket(ticket),
                                      ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              Center(
                                child: Text(
                                  'Redeem by reference number',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColors.textColorMediumEmphacy,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              AppTextField(
                                hintText: 'ABCD-1',
                                inputFormatters: [ReferenceInputFormatter()],
                                onChanged: (value) {
                                  setState(() {
                                    reference = value;
                                  });
                                },
                                suffixIcon: widget.referenceTicket != null
                                    ? Icons.arrow_circle_right_rounded
                                    : Icons.timelapse_rounded,
                                onSuffixButtonPressed: reference.length == 6 &&
                                        widget.referenceTicket != null
                                    ? () =>
                                        widget.referenceTicket?.call(reference)
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      AppAdaptiveTextButton(
                        onPressed: widget.onSignOut,
                        child: const Text('Sign out?'),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class ReferenceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i <= 3) {
        if (RegExp('[A-Za-z]').hasMatch(newText[i])) {
          buffer.write(newText[i].toUpperCase());
        }
      } else if (i == 4) {
        buffer.write('-');
        if (RegExp('[0-9]').hasMatch(newText[i])) {
          buffer.write(newText[i]);
        }
      } else if (i <= 5) {
        if (RegExp('[0-9]').hasMatch(newText[i])) {
          buffer.write(newText[i]);
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
