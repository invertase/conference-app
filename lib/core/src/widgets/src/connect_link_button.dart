import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../enums/links.dart';
import 'app_buttons.dart';

class ConnectLinkButton extends StatelessWidget {
  const ConnectLinkButton({
    super.key,
    required this.type,
    required this.url,
  });

  final Links type;
  final String url;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppAdaptiveIconButton(
      fillColor: isDark
          ? Theme.of(context).primaryColorLight.withOpacity(.1)
          : const Color(0xffEBF6FE),
      onPressed: () =>
          launchUrlString(url, mode: LaunchMode.externalApplication),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FaIcon(
            type.icon,
            color: isDark ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
