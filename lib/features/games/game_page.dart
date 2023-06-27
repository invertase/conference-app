import 'package:flutter/material.dart';

import 'dashing_viking/viking_game_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DashingVikingWidget());
  }
}
