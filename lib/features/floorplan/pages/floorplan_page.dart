import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FloorplanPage extends StatelessWidget {
  const FloorplanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 70,
                  left: 30,
                ),
                color: Colors.yellow,
                child: Image.asset(
                  'assets/images/floorplan.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                5,
                MediaQuery.of(context).padding.top + 20,
                5,
                0,
              ),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: AppAdaptiveIconButton(
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
