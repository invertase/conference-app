import 'package:conference_app/core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

Map<String, String> devs = {
  'Mais Alheraki': 'https://twitter.com/pr_mais',
  'Majid Hajian': 'https://twitter.com/mhadaily'
};

Map<String, String?> contributers = {};

class CreditPage extends StatelessWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                5,
                MediaQuery.of(context).padding.top + 20,
                5,
                0,
              ),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: AppAdaptiveIconButton(
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  MediaQuery.of(context).padding.bottom + 20,
                ),
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        const TextSpan(
                          text: 'This app is a product of ',
                        ),
                        TextSpan(
                          text: 'Invertase',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => launchUrlString(
                                  'https://invertase.io',
                                  mode: LaunchMode.externalApplication,
                                ),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Led by:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ...devs.keys
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            launchUrlString(
                              devs[e]!,
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: Text(
                            e,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 20),
                  Text(
                    'Find the project on GitHub:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrlString(
                          'https://github.com/invertase/conference-app');
                    },
                    child: Text(
                      'invertase/conference-app',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (contributers.isNotEmpty)
                    Text('Contributers: ',
                        style: Theme.of(context).textTheme.titleLarge),
                  ...contributers.keys
                      .map(
                        (e) => GestureDetector(
                          onTap: () async {
                            if (contributers[e] != null) {
                              launchUrlString(
                                contributers[e]!,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: Text(
                            e,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      decoration: contributers[e] != null
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
                                    ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
