import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:conference_app/core/core.dart';

import '../providers/activities_provider.dart';
import '../widgets/activity_item.dart';

class Activites extends ConsumerWidget {
  const Activites({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: const ConferenceAppBar(title: 'Activities'),
      body: ref.watch(activitiesProvider).map(
            data: (data) {
              return ListView(
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  MediaQuery.of(context).padding.bottom + 20,
                ),
                children: [
                  AnimatedSwitcher(
                    switchInCurve: Curves.elasticOut,
                    switchOutCurve: Curves.ease,
                    reverseDuration: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 1200),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    child: ref.watch(activitiesBanner).maybeMap(
                          data: (data) => data.value.endsWith('png')
                              ? Image.asset(data.value)
                              : CachedNetworkImage(imageUrl: data.value),
                          orElse: () => const SizedBox(),
                        ),
                  ),
                  const SizedBox(height: 15),
                  for (final activity in data.value)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: ActivityItem(activity: activity),
                    ),
                ],
              );
            },
            error: (error) => const Center(
              child: Text('Error fetching activities.'),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
    );
  }
}
