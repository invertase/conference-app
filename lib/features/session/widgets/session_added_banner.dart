import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:flutter_vikings/features/session/widgets/session_banner.dart';

class SessionAddedBanner extends ConsumerWidget {
  const SessionAddedBanner({
    super.key,
    this.onDelete,
    this.show = false,
  });

  final VoidCallback? onDelete;
  final bool show;

  @override
  Widget build(BuildContext context, ref) {
    return SessionBanner(
      show: show,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.kRadiusMedium,
          color: AppColors.secondaryColorSecondary.withOpacity(0.1),
        ),
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: AppRadius.kRadiusMedium,
                color: AppColors.secondaryColorSecondary.withOpacity(0.9),
              ),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsetsDirectional.only(end: 10),
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Text(
                'This session is added to your list!'
                ' we will remind you when it comes live.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            AppAdaptiveIconButton(
              onPressed: onDelete,
              child: Icon(
                Icons.delete_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
