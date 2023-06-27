import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/activity.dart';
import '../models/session_details.dart';
import '../models/speaker.dart';
import '../models/sponsor.dart';
import '../models/tab_item.dart';
import 'app_routes_names.dart';

extension AppRouterExtension on BuildContext {
  void goHome({TabItemId? tab}) {
    GoRouter.of(this).goNamed(
      RouteNames.home,
      pathParameters: {'tab': tab?.name ?? TabItemId.agenda.name},
    );
  }

  void pop() {
    GoRouter.of(this).pop();
  }

  /// Pushes a session page to the view.
  ///
  /// If [tab] was passed, the route location will have the tab name,
  /// e.g. `/app/speakers/session?id=123`. [tab] is optional and it
  /// defaults to [TabItemId.agenda].
  void pushSession(
    SessionDetails session, {
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.session,
      extra: session,
      pathParameters: {
        'tab': tab?.name ?? TabItemId.agenda.name,
      },
    );
  }

  void pushSponsor(
    Sponsor sponsor, {
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.sponsor,
      extra: sponsor,
      pathParameters: {'tab': tab?.name ?? TabItemId.sponsors.name},
    );
  }

  void pushSpeaker(
    Speaker speaker, {
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.speaker,
      extra: speaker,
      pathParameters: {
        'tab': tab?.name ?? TabItemId.agenda.name,
      },
    );
  }

  void pushNotifications({
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.notifications,
      pathParameters: {
        'tab': tab?.name ?? TabItemId.agenda.name,
      },
    );
  }

  void pushCodeOfConduct({
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.codeOfConduct,
      pathParameters: {
        'tab': tab?.name ?? TabItemId.agenda.name,
      },
    );
  }

  void pushCredit({
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.credit,
      pathParameters: {
        'tab': tab?.name ?? TabItemId.agenda.name,
      },
    );
  }

  void pushActivites({
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.activites,
      pathParameters: {
        'tab': tab?.name ?? TabItemId.agenda.name,
      },
    );
  }

  void pushActivityDetails(
    Activity activity, {
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.activity,
      extra: activity,
      pathParameters: {
        'tab': tab?.name ?? TabItemId.agenda.name,
      },
      queryParameters: {
        'id': activity.id,
      },
    );
  }

  void pushAboutUs({
    TabItemId? tab,
  }) {
    GoRouter.of(this).pushNamed(
      RouteNames.aboutUs,
      pathParameters: {
        'tab': tab?.name ?? TabItemId.agenda.name,
      },
    );
  }
}

extension ContainsRouteExtension on BuildContext {
  bool inRoute(String routeName) =>
      canPop() ? GoRouter.of(this).location.contains(routeName) : false;
}
