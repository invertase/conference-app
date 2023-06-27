import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';

/// Use to show a feedback dialog for 1 second at the bottom of the screen.
class FeedbackDialog {
  FeedbackDialog._(this.context);
  final BuildContext context;

  factory FeedbackDialog.of(BuildContext context) {
    return FeedbackDialog._(context);
  }

  void show(List<TextSpan> text) async {
    showGeneralDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (BuildContext context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(
                  20,
                  0,
                  20,
                  MediaQuery.of(context).padding.bottom + 20,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: AppRadius.kRadiusMedium,
                  boxShadow: [AppShadows.primaryBlack],
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                    children: text,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, Animation<double> anim1, __, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: anim1,
              curve: Curves.elasticOut,
              reverseCurve: Curves.easeInToLinear,
            ),
          ),
          child: child,
        );
      },
    );

    Future<void>.delayed(const Duration(milliseconds: 1500)).then((_) {
      Navigator.of(context, rootNavigator: true).pop();
    });
  }
}
