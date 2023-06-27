import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';

class NoSessions extends ConsumerWidget {
  const NoSessions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '🤔',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 50),
          ),
          const Text(
            'Looks like you didn\'t pick your favorite sessions yet!',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          AppAdaptiveOutlineButton(
            child: const Text('👈🏻 Let\'s go pick some'),
            onPressed: () {
              ref.watch(appCurrentTab.notifier).update((state) => state = 0);
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
