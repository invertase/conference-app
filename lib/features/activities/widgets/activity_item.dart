import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // final formatDate = DateFormat.yMMMMd('en_US').format(activity.due);

    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.kRadiusMedium,
        color: isDark
            ? AppColors.backgroundDarkCard.withOpacity(.04)
            : AppColors.backgroundWhite,
        boxShadow: [AppShadows.primaryBlack],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  activity.intro,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey[isDark ? 300 : 500]),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const DashedDivider(
            width: double.infinity,
            paddedEnds: false,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: SizedBox(
              width: 150,
              child: AppAdaptiveTextButton(
                child: const Text('View more'),
                onPressed: () {
                  context.pushActivityDetails(activity);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
