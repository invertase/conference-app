import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Image, Gradient;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../app_wrapper/configs/app_tabs.dart';
import 'viking_game.dart';

class DashingVikingWidget extends ConsumerWidget {
  const DashingVikingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localStorageRef = ref.read(localStorage);

    final highscore = localStorageRef.has('highscore')
        ? localStorageRef.get('highscore') as int
        : 0;

    return GameWidget(
      game: DashingVikingGame(
        highscore: highscore,
        persistScore: (value) {
          localStorageRef.set('highscore', value);
        },
        navigateBack: () {
          GoRouter.of(context).goNamed(
            RouteNames.home,
            pathParameters: {'tab': appTabs[0].id.name},
          );
        },
      ),
      loadingBuilder: (_) => const Center(
        child: Text('Loading'),
      ),
    );
  }
}
