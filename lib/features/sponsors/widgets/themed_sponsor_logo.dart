import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';

class ThemedSponsorLogo extends StatefulWidget {
  const ThemedSponsorLogo({
    super.key,
    required this.sponsor,
    this.skewedContainer = true,
    this.onClick,
  });

  final Sponsor sponsor;
  final bool skewedContainer;
  final VoidCallback? onClick;

  @override
  State<ThemedSponsorLogo> createState() => _ThemedSponsorLogoState();
}

class _ThemedSponsorLogoState extends State<ThemedSponsorLogo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final logoUrl =
        isDark ? widget.sponsor.logo.dark : widget.sponsor.logo.normal;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: widget.skewedContainer
          ? SkewedContainer(
              height: 300,
              child: child(logoUrl, isDark),
            )
          : child(logoUrl, isDark),
    );
  }

  child(logoUrl, isDark) => GestureDetector(
        onTap: widget.onClick,
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => const Center(child: Text('!')),
          placeholder: (context, _) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          imageUrl: logoUrl,
          memCacheHeight: 200,
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
