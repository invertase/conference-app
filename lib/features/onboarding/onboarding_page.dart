import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:conference_app/core/core.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller1;
  late final AnimationController _controller2;
  late final AnimationController _controller3;
  late final AnimationController _controller4;

  late final Animation<double> tween1;
  late final Animation<double> tween2;
  late final Animation<double> tween3;
  late final Animation<double> tween4;

  @override
  void initState() {
    // Once this widget is built for the first time, set to true to avoid showing it again.
    ref.read(localStorage).set(LocalStorageKeys.isFirstVisit, false);

    const period = Duration(milliseconds: 500);
    const curve = Curves.ease;
    _controller1 = AnimationController(vsync: this, duration: period);
    _controller2 = AnimationController(vsync: this, duration: period);
    _controller3 = AnimationController(vsync: this, duration: period);
    _controller4 = AnimationController(vsync: this, duration: period);

    tween1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller1, curve: curve))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(period, () async {
            try {
              await _controller2.forward().orCancel;
              await _controller2.reverse().orCancel;
            } catch (_) {}
          });
        }
      });

    tween2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller2, curve: curve))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(period, () async {
            try {
              await _controller3.forward().orCancel;
              await _controller3.reverse().orCancel;
            } catch (_) {}
          });
        }
      });

    tween3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller3, curve: curve))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(period, () async {
            try {
              await _controller4.forward().orCancel;
              await _controller4.reverse().orCancel;
            } catch (_) {}
          });
        }
      });

    tween4 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller4, curve: curve))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(period, () async {
            try {
              await _controller1.forward().orCancel;
              await _controller1.reverse().orCancel;
            } catch (_) {}
          });
        }
      });

    playAnimation();

    super.initState();
  }

  void playAnimation() async {
    await _controller1.forward();
    await _controller1.reverse();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logoWithText.png',
                      width: MediaQuery.of(context).size.width * .35,
                    ),
                    const SizedBox(height: 40),
                    const Text('The Biggest Nordic Flutter Conference!'),
                    const SizedBox(height: 20),
                    Text(
                      '31st AUG - 1st SEP, 2022',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textColorMediumEmphacy,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/images/startButtonBorder.svg',
                            ),
                            FadeTransition(
                              opacity: tween1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SvgPicture.asset(
                                  'assets/images/startButtonSubtract.svg',
                                ),
                              ),
                            ),
                            FadeTransition(
                              opacity: tween2,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Transform.rotate(
                                  angle: 90 * pi / 180,
                                  child: SvgPicture.asset(
                                    'assets/images/startButtonSubtract.svg',
                                  ),
                                ),
                              ),
                            ),
                            FadeTransition(
                              opacity: tween3,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Transform.rotate(
                                  angle: 90 * pi / 90,
                                  child: SvgPicture.asset(
                                    'assets/images/startButtonSubtract.svg',
                                  ),
                                ),
                              ),
                            ),
                            FadeTransition(
                              opacity: tween4,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Transform.rotate(
                                  angle: -90 * pi / 180,
                                  child: SvgPicture.asset(
                                    'assets/images/startButtonSubtract.svg',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: AppAdaptiveIconButton(
                          fillColor: Theme.of(context).primaryColor,
                          onPressed: context.goHome,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
