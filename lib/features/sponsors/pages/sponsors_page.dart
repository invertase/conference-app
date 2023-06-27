import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';

import '../widgets/themed_sponsor_logo.dart';

class SponsorsPage extends ConsumerStatefulWidget {
  const SponsorsPage({super.key});

  @override
  ConsumerState<SponsorsPage> createState() => _SponsorsPageState();
}

class _SponsorsPageState extends ConsumerState<SponsorsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ref.watch(sponsorsProvider).when(
      data: (data) {
        return GridView.builder(
          itemCount: data.length,
          addAutomaticKeepAlives: true,
          padding: EdgeInsets.only(
              top: 20, bottom: MediaQuery.of(context).padding.bottom),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final sponsor = data[index];
            return ThemedSponsorLogo(
              sponsor: sponsor,
              onClick: () => context.pushSponsor(sponsor),
            );
          },
        );
      },
      error: (error, s) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
