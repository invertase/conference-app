import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Link types with its associated icon.
enum Link {
  website(icon: FontAwesomeIcons.globe),
  twitter(icon: FontAwesomeIcons.twitter),
  linkedin(icon: FontAwesomeIcons.linkedin),
  github(icon: FontAwesomeIcons.github),
  sessionize(iconString: 'assets/icons/sessionize.png'),
  blog(icon: FontAwesomeIcons.blog),
  company_website(icon: FontAwesomeIcons.globe),
  other(icon: FontAwesomeIcons.link);

  const Link({this.icon, this.iconString});
  final IconData? icon;
  final String? iconString;
}
