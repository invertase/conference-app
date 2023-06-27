import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';

enum AgendaSpeakersView { list, carousel }

class AgendaHeader extends StatelessWidget {
  const AgendaHeader({
    super.key,
    required this.onViewChanged,
    this.view = AgendaSpeakersView.carousel,
  });

  final AgendaSpeakersView view;
  final ValueChanged<AgendaSpeakersView> onViewChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'AGENDA',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          AppAdaptiveIconButton(
            onPressed: () {
              onViewChanged(
                view == AgendaSpeakersView.carousel
                    ? AgendaSpeakersView.list
                    : AgendaSpeakersView.carousel,
              );
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: view == AgendaSpeakersView.list
                  ? Icon(
                      Icons.view_carousel_rounded,
                      color: Colors.grey[400],
                    )
                  : Icon(
                      Icons.view_agenda,
                      color: Colors.grey[400],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
