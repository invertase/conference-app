import 'dart:math';

import 'package:flame/components.dart';

import 'shield_item.dart';
import 'sword_item.dart';
import 'viking_game.dart';

class GearManager extends Component with HasGameRef<DashingVikingGame> {
  final _rng = Random();

  @override
  Future<void>? onLoad() async {
    add(TimerComponent(period: 3, onTick: _spawnGear, repeat: true));
  }

  void _spawnGear() {
    if (gameRef.isPlaying) {
      if (gameRef.player.sword == null && _takeChance()) {
        gameRef.add(
          SwordItem(
            position: Vector2(gameRef.size.x, gameRef.size.y / 2),
          ),
        );
      } else if (gameRef.player.shield == null && _takeChance()) {
        gameRef.add(
          ShieldItem(
            position: Vector2(gameRef.size.x, gameRef.size.y / 2),
          ),
        );
      }
    }
  }

  bool _takeChance() {
    // 40%
    return _rng.nextDouble() <= 0.4;
  }
}
