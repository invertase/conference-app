import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'viking_game.dart';

class ShieldItem extends SpriteComponent with HasGameRef<DashingVikingGame> {
  ShieldItem({
    super.position,
    this.beingHeld = false,
  }) : super(anchor: Anchor.center, size: Vector2(40, 40));

  final bool beingHeld;

  @override
  Future<void> onLoad() async {
    final frontSprite = sprite = Sprite(
      gameRef.spriteImage,
      srcPosition: Vector2(176, 48),
      srcSize: Vector2(48, 48),
    );

    final backSprite = Sprite(
      gameRef.spriteImage,
      srcPosition: Vector2(224, 48),
      srcSize: Vector2(48, 48),
    );

    if (!beingHeld) {
      add(RectangleHitbox());
    }

    if (!beingHeld) {
      add(
        SequenceEffect(
          [
            ScaleEffect.to(Vector2(-1, 1), LinearEffectController(1)),
            ScaleEffect.to(Vector2(0, 1), LinearEffectController(1))
              ..onComplete = () {
                sprite = backSprite;
              },
            ScaleEffect.to(Vector2(1, 1), LinearEffectController(1)),
            ScaleEffect.to(Vector2(0, 1), LinearEffectController(1))
              ..onComplete = () {
                sprite = frontSprite;
              },
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
