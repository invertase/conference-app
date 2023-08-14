import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/src/feedback_dialog.dart';

extension AddedToAgendaFeedback on BuildContext {
  void addedToAgenda(String sessionTitle) => FeedbackDialog.of(this).show([
        TextSpan(
          text: '$sessionTitle ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColorSecondary,
          ),
        ),
        const TextSpan(text: 'has been added to your agenda!'),
      ]);

  void removedFromAgenda(String sessionTitle) => FeedbackDialog.of(this).show([
        TextSpan(
          text: '$sessionTitle ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),
        const TextSpan(text: 'has been removed from your agenda.'),
      ]);

  void thanksForRating() => FeedbackDialog.of(this).show([
        const TextSpan(
          text: 'We have receieved your rating. Thank you! 💙',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColorSecondary,
          ),
        ),
      ]);
}
