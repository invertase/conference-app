import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';

class RoomBadge extends StatelessWidget {
  const RoomBadge({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: AppRadius.kRadiusExtraSmall,
        color: Theme.of(context).primaryColorLight.withOpacity(0.1),
        boxShadow: [AppShadows.primaryBlack],
      ),
      child: Text(
        room.name.toUpperCase(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).primaryColorLight,
            ),
      ),
    );
  }
}
