import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Link types with its associated icon.
enum Links {
  website(FontAwesomeIcons.globe),
  twitter(FontAwesomeIcons.twitter),
  linkedin(FontAwesomeIcons.linkedin),
  github(FontAwesomeIcons.github);

  const Links(this.icon);
  final IconData icon;
}
