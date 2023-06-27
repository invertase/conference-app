import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vikings/core/core.dart';

class AgendaRoomPicker extends StatefulWidget {
  const AgendaRoomPicker({
    super.key,
    required this.onRoomSelected,
  });

  final ValueChanged<Room> onRoomSelected;

  @override
  State<AgendaRoomPicker> createState() => _AgendaRoomPickerState();
}

class _AgendaRoomPickerState extends State<AgendaRoomPicker> {
  final duration = const Duration(milliseconds: 200);
  Room currentRoom = eventRooms.values.first;

  void setCurrentRoom(Room room) {
    widget.onRoomSelected.call(room);
    setState(() {
      currentRoom = room;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.only(start: 10.0, bottom: 10.0),
          child: Text('ROOM'),
        ),
        DefaultTabController(
          length: eventRooms.length,
          initialIndex: eventRooms.values.toList().indexOf(currentRoom),
          child: TabBar(
            enableFeedback: true,
            splashBorderRadius: BorderRadius.circular(15),
            indicator: const BoxDecoration(),
            labelPadding: EdgeInsets.zero,
            tabs: eventRooms.values
                .map(
                  (room) => Builder(
                    builder: (context) {
                      return AnimatedContainer(
                        duration: duration,
                        width: double.infinity,
                        foregroundDecoration: BoxDecoration(
                          border: Border.all(
                            color: currentRoom == room
                                ? Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        decoration: BoxDecoration(
                          color: room == currentRoom
                              ? Theme.of(context).brightness == Brightness.light
                                  ? Colors.transparent
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.2)
                              : Colors.white.withOpacity(0.02),
                          border: Border.all(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey.withOpacity(0.15)
                                    : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsetsDirectional.only(
                          start: eventRooms.values.first == room ? 0 : 5,
                          end: eventRooms.values.last == room ? 0 : 5,
                        ),
                        child: AppAdaptiveTextButton(
                          noPadding: true,
                          onPressed: () {
                            setCurrentRoom(room);
                            DefaultTabController.of(context).animateTo(
                              eventRooms.values.toList().indexOf(room),
                              duration: duration,
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(room.image!),
                                FittedBox(
                                  child: Text(
                                    room.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
