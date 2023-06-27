import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'blow_to_kingdom_come_effect.dart';
import 'obstacle/obstacle.dart';
import 'shield_item.dart';
import 'sword_item.dart';
import 'viking_game.dart';

enum PlayerState { crashed, jumping, running, waiting }

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef<DashingVikingGame>, CollisionCallbacks {
  Player() : super(size: Vector2(48, 56));

  final double gravity = 1;

  final double initialJumpVelocity = -15.0;
  final double introDuration = 1500.0;
  final double startXPosition = 50;

  double _jumpVelocity = 0.0;

  SwordItem? sword;
  ShieldItem? shield;

  double get groundYPos {
    return (gameRef.size.y / 2) - 18;
  }

  @override
  Future<void> onLoad() async {
    // Body hitbox
    add(
      RectangleHitbox.relative(
        Vector2(0.7, 0.6),
        position: Vector2(0, height / 3),
        parentSize: size,
      ),
    );
    // Head hitbox
    add(
      RectangleHitbox.relative(
        Vector2(0.45, 0.35),
        position: Vector2(width / 2, 0),
        parentSize: size,
      ),
    );
    animations = {
      PlayerState.running: _getAnimation(
        size: Vector2(88.0, 96.0),
        frames: [Vector2(1514.0, 0), Vector2(1602.0, 0)],
        stepTime: 0.2,
      ),
      PlayerState.waiting: _getAnimation(
        size: Vector2(88.0, 96.0),
        frames: [Vector2(76.0, 0)],
      ),
      PlayerState.jumping: _getAnimation(
        size: Vector2(88.0, 96.0),
        frames: [Vector2(1338.0, 0)],
      ),
      PlayerState.crashed: _getAnimation(
        size: Vector2(88.0, 96.0),
        frames: [Vector2(1778.0, 0)],
      ),
    };
    current = PlayerState.waiting;
  }

  void jump(double speed) {
    if (current == PlayerState.jumping) {
      return;
    }

    current = PlayerState.jumping;
    _jumpVelocity = initialJumpVelocity - (speed / 500);
  }

  void resetMatch() {
    sword?.removeFromParent();
    shield?.removeFromParent();

    sword = null;
    shield = null;

    reset();
  }

  void reset() {
    y = groundYPos;
    _jumpVelocity = 0.0;
    current = PlayerState.running;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (current == PlayerState.jumping) {
      y += _jumpVelocity;
      _jumpVelocity += gravity;
      if (y > groundYPos) {
        reset();
      }
    } else {
      y = groundYPos;
    }

    if (gameRef.isIntro && x < startXPosition) {
      x += (startXPosition / introDuration) * dt * 5000;
    }
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    y = groundYPos;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Obstacle && !other.underExplosion) {
      if (sword != null) {
        other.explode();
        sword?.add(BlowToKingdomComeEffect());
        sword = null;
      } else if (shield != null) {
        other.explode();
        shield?.add(BlowToKingdomComeEffect());
        shield = null;
      } else {
        gameRef.gameOver();
      }
    } else if (other is SwordItem) {
      other.removeFromParent();
      addSword();
    } else if (other is ShieldItem) {
      other.removeFromParent();
      addShield();
    }
  }

  void addSword() {
    if (sword == null) {
      add(sword =
          SwordItem(position: Vector2(size.x, size.y - 10), beingHeld: true));
    }
  }

  void addShield() {
    if (shield == null) {
      add(shield =
          ShieldItem(position: Vector2(0, size.y - 20), beingHeld: true));
    }
  }

  SpriteAnimation _getAnimation({
    required Vector2 size,
    required List<Vector2> frames,
    double stepTime = double.infinity,
  }) {
    return SpriteAnimation.spriteList(
      frames
          .map(
            (vector) => Sprite(
              gameRef.spriteImage,
              srcSize: size,
              srcPosition: vector,
            ),
          )
          .toList(),
      stepTime: stepTime,
    );
  }
}
