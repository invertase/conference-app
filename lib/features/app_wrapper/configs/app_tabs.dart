import 'package:flutter/material.dart';
import 'package:conference_app/core/core.dart';

import '../../../core/src/models/tab_item.dart';
import '../../agenda/pages/agenda_page.dart';
import '../../my_agenda/pages/my_agenda_page.dart';
import '../../speakers/pages/speakers_page.dart';

/// The current tabs in the app.
///
/// To add a new tab just append it to this list.
List<TabItem> appTabs = const [
  TabItem(
    id: TabItemId.agenda,
    view: AgendaPage(),
    icon: AppIcons.agendaTab,
    activeIconColor: AppColors.primaryColorMain,
    iconColor: AppColors.textColorLowEmphacy,
    tooltip: 'Agenda',
  ),
  TabItem(
    id: TabItemId.myAgenda,
    view: MyAgenda(),
    icon: AppIcons.myAgendaTab,
    activeIconColor: Colors.white,
    iconColor: AppColors.textColorLowEmphacy,
    tooltip: 'My agenda',
  ),
  // TabItem(
  //   id: TabItemId.ticket,
  //   view: TicketPage(),
  //   icon: AppIcons.ticketTab,
  //   activeIconColor: AppColors.backgroundWhite,
  //   tooltip: 'My ticket',
  // ),
  // TabItem(
  //   id: TabItemId.sponsors,
  //   view: SponsorsPage(),
  //   icon: AppIcons.sponsorsTab,
  //   activeIconColor: AppColors.primaryColorMain,
  //   iconColor: AppColors.textColorLowEmphacy,
  //   tooltip: 'Sponsors',
  // ),
  TabItem(
    id: TabItemId.speakers,
    view: SpeakersPage(),
    icon: AppIcons.speakersTab,
    activeIconColor: AppColors.primaryColorMain,
    iconColor: AppColors.textColorLowEmphacy,
    tooltip: 'Speakers',
  ),
];
