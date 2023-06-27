import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_app/features/features.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../configs/local_storage_keys.dart';
import '../models/activity.dart';
import '../models/session_details.dart';
import '../models/speaker.dart';
import '../models/tab_item.dart';
import '../providers/local_storage_provider.dart';
import '../providers/sessions_provider.dart';
import '../providers/speakers_provider.dart';
import '../services/notifications_service.dart';
import 'app_notifications_click_observer.dart';
import 'app_routes_names.dart';
import 'app_routes_paths.dart';

class AppRouter {
  AppRouter(WidgetRef ref) {
    mainRouter = _getMainRouter(ref);
  }

  /// This variable is used in testing to change the initial
  /// location and access some page right away.
  /// When using it with sub locations, make sure to include
  /// the paths of all the parent routes.
  @visibleForTesting
  String setInitialLocation(String location) => initialLocation = location;

  static String initialLocation = RoutePaths.app;

  late GoRouter mainRouter;

  bool showOnboardingForFirstTimeUsers(GoRouterState state, WidgetRef ref) {
    final isFirstTime =
        ref.watch(localStorage).get(LocalStorageKeys.isFirstVisit) ?? true;
    return isFirstTime && state.location != RoutePaths.onboarding;
  }

  GoRouter _getMainRouter(WidgetRef ref) => GoRouter(
        observers: [
          NotificationObserver(
            NotificationsService(
              FlutterLocalNotificationsPlugin(),
              FirebaseFirestore.instance,
              FirebaseMessaging.instance,
            ),
            ref.read(sessionService),
            ref.read(speakersService),
          ),
        ],
        initialLocation: initialLocation,
        debugLogDiagnostics: true,
        redirect: (context, state) {
          if (showOnboardingForFirstTimeUsers(state, ref)) {
            return RoutePaths.onboarding;
          }

          return null;
        },
        routes: [
          GoRoute(
            path: RoutePaths.onboarding,
            name: RouteNames.onboarding,
            builder: (context, state) => const OnboardingPage(),
          ),
          GoRoute(
            path: '/',
            redirect: (context, state) {
              final tabId = state.pathParameters['tab'];
              return '/app/${tabId ?? TabItemId.agenda.name}';
            },
          ),
          GoRoute(
            path: '/app/:tab',
            name: RouteNames.home,
            builder: (context, state) {
              final tabId = state.pathParameters['tab'];
              final tabItem = TabItemId.values.firstWhere(
                (tabItem) => tabItem == TabItemId.values.byName(tabId!),
                orElse: (() => throw Exception('Tab not found: $tabId')),
              );

              return AppWrapper(key: state.pageKey, initialTab: tabItem);
            },
            routes: [
              GoRoute(
                path: RoutePaths.session,
                name: RouteNames.session,
                builder: (context, state) => SessionDetailsPage(
                  session: (state.extra as SessionDetails).session,
                  speakers: [...(state.extra as SessionDetails).speakers],
                ),
              ),
              GoRoute(
                path: RoutePaths.speaker,
                name: RouteNames.speaker,
                builder: (context, state) => SpeakerInfoPage(
                  speaker: state.extra as Speaker,
                ),
              ),
              GoRoute(
                path: RoutePaths.notifications,
                name: RouteNames.notifications,
                builder: (context, state) => const NotificationsPage(),
              ),
              GoRoute(
                path: RoutePaths.codeOfConduct,
                name: RouteNames.codeOfConduct,
                builder: (context, state) => const CodeOfConductPage(),
              ),
              GoRoute(
                path: RoutePaths.credit,
                name: RouteNames.credit,
                builder: (context, state) => const CreditPage(),
              ),
              GoRoute(
                path: RoutePaths.activites,
                name: RouteNames.activites,
                builder: (context, state) => const Activites(),
                routes: [
                  GoRoute(
                    path: RoutePaths.activity,
                    name: RouteNames.activity,
                    builder: (context, state) =>
                        ActivityDetailsPage(activity: state.extra as Activity),
                  ),
                ],
              ),
              GoRoute(
                path: RoutePaths.aboutUs,
                name: RouteNames.aboutUs,
                builder: (context, state) => const AboutUsPage(),
              ),
            ],
          ),
        ],
      );
}
