import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/themed_sponsor_logo.dart';

class SponsorInfoPage extends StatefulWidget {
  const SponsorInfoPage({
    super.key,
    required this.sponsor,
  });

  final Sponsor sponsor;

  @override
  State<SponsorInfoPage> createState() => _SponsorInfoPageState();
}

class _SponsorInfoPageState extends State<SponsorInfoPage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
            backgroundColor:
                Theme.of(context).primaryColorLight.withOpacity(0.05),
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            expandedHeight: 240,
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 40,
                height: 40,
                child: AppAdaptiveIconButton(
                  onPressed: context.pop,
                  child: const Icon(Icons.arrow_back_ios_rounded),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top * 1.5,
                  left: MediaQuery.of(context).padding.top,
                  right: MediaQuery.of(context).padding.top,
                ),
                child: ThemedSponsorLogo(
                  sponsor: widget.sponsor,
                  skewedContainer: false,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              0,
              10,
              0,
              MediaQuery.of(context).padding.bottom,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Text(
                      widget.sponsor.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                  if (widget.sponsor.tagline != null)
                    Center(
                      child: Text(
                        widget.sponsor.tagline!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[isDark ? 200 : 500],
                            ),
                      ),
                    ),
                  const SizedBox(height: 30),
                  if (widget.sponsor.about != null)
                    SponsorInfoCard(
                      content: [
                        Text(
                          'About us',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          widget.sponsor.about!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  if (widget.sponsor.contest != null)
                    SponsorInfoCard(
                      content: [
                        Text(
                          'Our Contest for Flutter Vikings',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.sponsor.contest!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        if (widget.sponsor.contestLink != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: AppAdaptivePrimaryButton(
                              noPadding: true,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Text('Join this contest'),
                              ),
                              onPressed: () {
                                launchUrlString(widget.sponsor.contestLink!);
                              },
                            ),
                          )
                      ],
                    ),
                  if (widget.sponsor.links.isNotEmpty)
                    SponsorInfoCard(
                      content: [
                        Text(
                          'Links',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            for (final s in widget.sponsor.links)
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 10),
                                child: ConnectLinkButton(
                                  type: Links.values.byName(
                                      (s['linkType'] as String).toLowerCase()),
                                  url: s['url'],
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SponsorInfoCard extends StatelessWidget {
  const SponsorInfoCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SkewedContainer(
        skew: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content,
          ),
        ),
      ),
    );
  }
}
