import 'dart:developer';

import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

class VerifyEmail extends ConsumerStatefulWidget {
  const VerifyEmail({
    super.key,
    required this.email,
  });

  final String email;

  @override
  ConsumerState<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends ConsumerState<VerifyEmail> {
  bool _loading = false;

  set loading(bool value) {
    setState(() {
      _loading = value;
    });
  }

  void reload() async {
    loading = true;
    await ref.read(userInstanceProvider)!.reload();
    ref.invalidate(userInstanceProvider);
    loading = false;
  }

  void resend() async {
    try {
      loading = true;
      await ref.read(userInstanceProvider)!.sendEmailVerification();
      ref.invalidate(userInstanceProvider);
    } catch (e) {
      log(e.toString());
    } finally {
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        boxShadow: [AppShadows.secondaryBlack],
        color: isDark
            ? AppColors.backgroundDarkCard.withOpacity(.04)
            : AppColors.backgroundWhite,
        borderRadius: AppRadius.kRadiusMedium,
      ),
      child: Column(
        children: [
          Text(
            'MY TICKET',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 50),
          Icon(
            Icons.mail_rounded,
            color: Theme.of(context).primaryColor,
            size: 50,
          ),
          const SizedBox(height: 10),
          Text(
            'Welcome ${widget.email}!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          const Text(
            'We have sent you an email to verify your account, '
            'please check your inbox.',
            textAlign: TextAlign.center,
          ),
          Text(
            'Check spam too.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          const SizedBox(height: 50),
          AppAdaptivePrimaryButton(
            onPressed: _loading ? null : reload,
            child: const Text('Reload'),
          ),
          const SizedBox(height: 10),
          AppAdaptiveTextButton(
            onPressed: _loading ? null : resend,
            child: const Text('Resend email?'),
          )
        ],
      ),
    );
  }
}
