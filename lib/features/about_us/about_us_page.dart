import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ConferenceAppBar(title: 'About FlutterVikings'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: 100,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
                "FlutterVikings is a community-driven event made up of GDGs and other Nordic user groups "
                "focused on Flutter and Dart, as well as the global Flutter Community. With a fantastic "
                "lineup of Google Developer Experts and top-notch international speakers the FlutterVikings "
                "Conference boasts two of the best Flutter and Dart tracks anywhere, offering some of the "
                "most informative, technical and actually useful talks anywhere."),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                launchUrlString(
                  'https://www.fluttervikings.com',
                  mode: LaunchMode.externalApplication,
                );
              },
              child:
                  const Text('Visit flutterviking.com for more information.'),
            ),
          ],
        ),
      ),
    );
  }
}
