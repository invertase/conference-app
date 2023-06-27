import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'viking_game.dart';

class SwordItem extends SpriteComponent with HasGameRef<DashingVikingGame> {
  SwordItem({
    super.position,
    this.beingHeld = false,
  }) : super(anchor: Anchor.bottomCenter, size: Vector2(22, 60));

  final bool beingHeld;

  @override
  Future<void> onLoad() async {
    sprite = Sprite(
      gameRef.spriteImage,
      srcPosition: Vector2(11, 0),
      srcSize: Vector2(42, 80),
    );

    if (!beingHeld) {
      add(RectangleHitbox());
    }

    if (!beingHeld) {
      add(
        SequenceEffect(
          [
            ScaleEffect.to(Vector2(-1, 1), LinearEffectController(1)),
            ScaleEffect.to(Vector2(1, 1), LinearEffectController(1)),
          ],
          infinite: true,
        ),
      );
    }
  }

  bool get isVisible => (x + width) > 0;

  @override
  void update(double dt) {
    super.update(dt);
    if (!beingHeld) {
      x -= gameRef.currentSpeed * dt;

      if (!isVisible) {
        removeFromParent();
      }
    }
  }
}
