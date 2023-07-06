import 'package:conference_app/core/core.dart';
import 'package:conference_app/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tests the navigation of the app.
///
/// This test uses the [GoRouter] to navigate through the app.
///
Future<void> routerTests(WidgetTester tester) async {
  // Pump the widget tree to process navigation
  await tester.pumpAndSettle();

  // Verify AppWrapper is displayed
  expect(find.byType(AppWrapper), findsOneWidget);

  // Verify HomeTabs is displayed
  expect(find.byType(MainBottomNavigatiopnBarIcon), findsWidgets);

  // Tap on the My Agenda tab
  await tester.tap(find.byKey(const ValueKey(TabItemId.myAgenda)));

  // Pump the widget tree to process navigation
  await tester.pumpAndSettle();

  // Verify My Agenda page is displayed
  expect(find.byType(MyAgenda), findsOneWidget);

  // Tap on the Speakers tab
  await tester.tap(find.byKey(const ValueKey(TabItemId.speakers)));

  // Pump the widget tree to process navigation
  await tester.pumpAndSettle();

  // Verify Speakers page is displayed
  expect(find.byType(SpeakersPage), findsOneWidget);

  // Tap on the Home tab
  await tester.tap(find.byKey(const ValueKey(TabItemId.agenda)));

  // Pump the widget tree to process navigation
  await tester.pumpAndSettle();

  // Tap on a session
  await tester.tap(find.byType(AgendaCard).first);

  // Pump the widget tree to process navigation
  await tester.pumpAndSettle();

  // Verify SessionDetails page is displayed
  expect(find.byType(SessionDetailsPage), findsOneWidget);

  // Tap on the back button
  await tester.tap(find.byType(AppAdaptiveIconButton).first);

  // Pump the widget tree to process navigation
  await tester.pumpAndSettle();

  // Verify Agenda page is displayed
  expect(find.byType(AgendaPage), findsOneWidget);

  // Change day to last day
  await tester.tap(find.byKey(ValueKey(eventDays.last.name)));

  // Pump the widget tree to process navigation
  await tester.pumpAndSettle();

  // Verify Agenda page is displayed
  expect(find.byType(AgendaPage), findsOneWidget);
}
