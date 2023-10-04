import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/core.dart';

class ConferenceApp extends ConsumerStatefulWidget {
  const ConferenceApp({super.key});

  @override
  ConsumerState<ConferenceApp> createState() => _ConferenceAppState();
}

class _ConferenceAppState extends ConsumerState<ConferenceApp> {
  late AppRouter appRouter;

  @override
  void initState() {
    appRouter = AppRouter(ref);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.wait<void>([
        precacheImage(
          Image.asset('assets/images/bottom_navigation_bar_blur.png').image,
          context,
        ),
      ]);

      await ref.watch(messagingService).token;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'example',
      routerDelegate: appRouter.mainRouter.routerDelegate,
      routeInformationParser: appRouter.mainRouter.routeInformationParser,
      routeInformationProvider: appRouter.mainRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: const AppTheme(ThemeType.light).getTheme(),
      darkTheme: const AppTheme(ThemeType.dark).getTheme(),
      themeMode: ref.watch(themeSwitcher),
    );
  }
}
