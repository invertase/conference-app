import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vikings/core/core.dart';

import 'sign_up_form.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    super.key,
    this.ticket,
    this.email,
    this.password,
    this.onSignUp,
    this.onSignOut,
    this.onGenerateBadge,
  });

  final Ticket? ticket;
  final ValueChanged<String>? email;
  final ValueChanged<String>? password;
  final VoidCallback? onSignUp;
  final VoidCallback? onSignOut;
  final VoidCallback? onGenerateBadge;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: Column(
          children: [
            ticket == null
                ? Text(
                    'MY TICKET',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                : Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            CachedNetworkImageProvider(ticket!.avatarUrl),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Hello, ${ticket!.name}!',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Here is your ticket',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 520,
              decoration: BoxDecoration(
                boxShadow: [AppShadows.secondaryBlack],
              ),
              child: ClipPath(
                clipper: _DolDurmaClipper(
                  holeRadius: 50,
                  bottom: 500 * .24,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.kRadiusMedium,
                    boxShadow: [AppShadows.secondaryBlack],
                    color: isDark
                        ? AppColors.backgroundDarkCard.withOpacity(.04)
                        : AppColors.backgroundWhite,
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (ticket == null)
                        TicketSignUpForm(
                          email: email,
                          password: password,
                        ),
                      if (ticket != null)
                        Positioned(
                          top: 0,
                          bottom: 500 * .24 + 25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                AppImages.logo,
                                width: 50,
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(text: ticket!.reference),
                                  );

                                  FeedbackDialog.of(context).show(
                                    const [
                                      TextSpan(text: AppStrings.copyFeedback)
                                    ],
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      ticket!.reference,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Icon(
                                      Icons.copy_rounded,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color
                                          ?.withOpacity(.2),
                                    ),
                                  ],
                                ),
                              ),
                              AppAdaptiveTextButton(
                                onPressed: onGenerateBadge,
                                child: const Row(
                                  children: [
                                    Text(AppStrings.downloadBadge),
                                    SizedBox(width: 10),
                                    Icon(Icons.badge_rounded)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              CachedNetworkImage(
                                imageUrl: ticket!.qr,
                                fit: BoxFit.cover,
                                width: 130,
                              ),
                            ],
                          ),
                        ),
                      const Positioned(
                        bottom: 500 * .24 + 25,
                        child: DashedDivider(width: 500),
                      ),
                      Positioned(
                        bottom: 500 * .08,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: AppAdaptivePrimaryButton(
                            onPressed: ticket == null ? onSignUp : onSignOut,
                            child:
                                Text(ticket == null ? 'Sign up' : 'Sign out'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DolDurmaClipper extends CustomClipper<Path> {
  final double holeRadius;
  final double bottom;

  _DolDurmaClipper({required this.holeRadius, required this.bottom});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - bottom - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - bottom),
        clockwise: true,
        radius: const Radius.circular(1),
      )
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - bottom)
      ..arcToPoint(
        Offset(size.width, size.height - bottom - holeRadius),
        clockwise: true,
        radius: const Radius.circular(1),
      );

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(_DolDurmaClipper oldClipper) => true;
}
