import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    this.show = false,
  });

  final bool show;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: show
          ? Container(
              color: Colors.transparent,
              key: const Key('loading_overlay'),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.1),
                    borderRadius: AppRadius.kRadiusMedium,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
