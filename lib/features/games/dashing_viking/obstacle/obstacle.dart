import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../blow_to_kingdom_come_effect.dart';
import '../random_extension.dart';
import '../viking_game.dart';
import 'obstacle_type.dart';

class Obstacle extends SpriteComponent with HasGameRef<DashingVikingGame> {
  Obstacle({
    required this.settings,
    required this.groupIndex,
  }) : super(size: settings.size);

  final double _gapCoefficient = 0.6;
  final double _maxGapCoefficient = 1.5;

  bool followingObstacleCreated = false;
  late double gap;
  final ObstacleTypeSettings settings;
  final int groupIndex;

  bool underExplosion = false;

  bool get isVisible => (x + width) + gap > 0;

  @override
  Future<void> onLoad() async {
    sprite = settings.sprite(gameRef.spriteImage);
    x = gameRef.size.x + width * groupIndex;
    y = settings.y;
    gap = computeGap(_gapCoefficient, gameRef.currentSpeed);
    addAll(settings.generateHitboxes());
  }

  double computeGap(double gapCoefficient, double speed) {
    final minGap =
        (speed / settings.minSpeed * settings.minGap * gapCoefficient)
            .roundToDouble();
    final maxGap = (minGap * _maxGapCoefficient).roundToDouble();
    return random.fromRange(minGap, maxGap);
  }

  void explode() {
    underExplosion = true;
    descendants().whereType<ShapeHitbox>().forEach((hitbox) {
      hitbox.removeFromParent();
    });
    add(BlowToKingdomComeEffect());
  }

  @override
  void update(double dt) {
    if (!underExplosion) {
      x -= gameRef.currentSpeed * dt;

      if (!isVisible) {
        removeFromParent();
      }
    }
  }
}
