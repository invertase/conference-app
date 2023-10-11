import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/feedback_dialog_extension.dart';
import '../../models/session.dart';
import '../../providers/my_agenda_provider.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_shadows.dart';
import 'app_buttons.dart';

class AgendaAddButton extends ConsumerWidget {
  const AgendaAddButton({
    super.key,
    required this.session,
  });

  /// The session to to be added to the user's local storage.
  final Session session;

  @override
  Widget build(BuildContext context, ref) {
    final isMyAgenda = ref.watch(isAddedToMyAgenda(session));

    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: SvgPicture.asset(
              'assets/images/add_button_border.svg',
              colorFilter: isMyAgenda
                  ? ColorFilter.mode(
                      AppColors.secondaryColorSecondary.withOpacity(0.4),
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                isMyAgenda ? AppShadows.secondaryGreen : AppShadows.primaryBlue
              ],
            ),
            child: AppAdaptiveIconButton(
              fillColor: Theme.of(context).primaryColor,
              disabledColor: AppColors.secondaryColorSecondary.withOpacity(0.3),
              onPressed: isMyAgenda
                  ? null
                  : () {
                      ref.read(myAgenda.notifier).add(session);
                      context.addedToAgenda(session.title);
                    },
              noPadding: true,
              child: Icon(
                isMyAgenda ? Icons.check_rounded : Icons.add_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
