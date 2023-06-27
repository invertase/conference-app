import 'package:flutter/material.dart';
import 'package:conference_app/core/core.dart';
import 'package:intl/intl.dart';

class AgendaDayPicker extends StatefulWidget {
  const AgendaDayPicker({
    super.key,
    required this.onDaySelected,
    required this.initialDay,
  });

  final ValueChanged<Day> onDaySelected;
  final Day initialDay;

  @override
  State<AgendaDayPicker> createState() => _AgendaDayPickerState();
}

class _AgendaDayPickerState extends State<AgendaDayPicker> {
  final duration = const Duration(milliseconds: 400);
  final dateFormat = DateFormat('d - M - y');
  late Day currentDay;

  @override
  void initState() {
    super.initState();
    currentDay = widget.initialDay;
  }

  void setCurrentDay(Day day) {
    widget.onDaySelected.call(day);
    setState(() {
      currentDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Theme.of(context).brightness == Brightness.light
            ? Border.all(color: Colors.grey[200]!, width: .5)
            : null,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DefaultTabController(
        length: eventDays.length,
        initialIndex: eventDays.indexOf(currentDay),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).brightness == Brightness.light
                ? null
                : Colors.white.withOpacity(0.04),
          ),
          child: TabBar(
            enableFeedback: true,
            splashBorderRadius: BorderRadius.circular(15),
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            labelPadding: EdgeInsets.zero,
            onTap: (day) => setCurrentDay(eventDays[day]),
            tabs: eventDays
                .map(
                  (day) => Center(
                    child: Builder(
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          child: AppAdaptiveTextButton(
                            noPadding: true,
                            onPressed: () {
                              setCurrentDay(day);
                              DefaultTabController.of(context).animateTo(
                                eventDays.indexOf(day),
                                duration: duration,
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            },
                            child: DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: currentDay == day
                                        ? Colors.white
                                        : AppColors.textColorLowEmphacy,
                                  ),
                              child: Column(
                                children: [
                                  Text(day.name),
                                  Text(
                                    dateFormat.format(day.date),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? AppColors.secondaryColorMain
                                              : Colors.white54,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
