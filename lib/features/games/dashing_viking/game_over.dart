import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'viking_game.dart';

class GameOverPanel extends Component {
  bool visible = false;

  @override
  Future<void> onLoad() async {
    add(GameOverText());
    add(GameOverRestart());
    add(GameOverExit());
  }

  @override
  void renderTree(Canvas canvas) {
    if (visible) {
      super.renderTree(canvas);
    }
  }
}

class GameOverText extends SpriteComponent with HasGameRef<DashingVikingGame> {
  GameOverText() : super(size: Vector2(382, 25), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    sprite = Sprite(
      gameRef.spriteImage,
      srcPosition: Vector2(955.0, 26.0),
      srcSize: size,
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    x = size.x / 2;
    y = size.y * .25;
  }
}

class GameOverRestart extends SpriteComponent
    with HasGameRef<DashingVikingGame> {
  GameOverRestart() : super(size: Vector2(72, 64), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    sprite = Sprite(
      gameRef.spriteImage,
      srcPosition: Vector2(2324, 4),
      srcSize: size,
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    x = size.x / 2;
    y = size.y * .75;
  }
}

class GameOverExit extends SpriteComponent
    with HasGameRef<DashingVikingGame>, TapCallbacks {
  GameOverExit() : super(size: Vector2(72, 64), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    sprite = Sprite(
      gameRef.spriteImage,
      srcPosition: Vector2(2244, 4),
      srcSize: size,
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    x = size.x / 2;
    y = size.y * .85;
  }

  @override
  bool onTapDown(TapDownEvent event) {
    gameRef.navigateBack();
    return true;
  }
}
