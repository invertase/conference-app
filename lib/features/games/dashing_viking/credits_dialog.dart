import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CreditsDialog extends StatelessWidget {
  const CreditsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 320,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dashing Vikings Credits',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            const Text("Inspired by Chrome's Dinousaur game"),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Made with 💙 by: "),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                      'https://twitter.com/CptPixel',
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    "Erick Zanardo",
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text('Based on the first '),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                      'https://github.com/flame-engine/flame/tree/main/examples/games/trex',
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    "Dino run port for Flame",
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
                const Text(": "),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                      'https://twitter.com/reNotANumber',
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    "Renan Araújo",
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
                const Text(" and "),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                      'https://twitter.com/spydon',
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    "Lukas Klingsbo",
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
