import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import 'credits_dialog.dart';
import 'viking_game.dart';

class TitleOverlay extends PositionComponent
    with HasGameRef<DashingVikingGame> {
  TitleOverlay() : super(priority: 2);

  late final RectangleComponent _overlay;
  late final _Border _topBorder;
  late final _Border _bottomBorder;
  late final SpriteComponent _logo;
  late final _PlayButton _playButton;
  late final _CreditsButton _creditsButton;
  late final _ExitButton _exitButton;
  late final TextComponent _scoreText;

  @override
  Future<void> onLoad() async {
    add(
      _overlay = RectangleComponent(
        size: gameRef.size,
        paint: Paint()..color = const Color(0xddf7f7f7),
        priority: 1,
      ),
    );

    add(_topBorder = _Border());
    add(_bottomBorder = _Border(true));

    final logoSizeValue = gameRef.size.x * 0.8;
    final logoSize = Vector2.all(logoSizeValue);
    add(
      _logo = SpriteComponent(
        anchor: Anchor.center,
        position: (gameRef.size / 2) - (Vector2(0, logoSizeValue / 2)),
        size: logoSize,
        priority: 2,
        sprite: Sprite(
          gameRef.spriteTitle,
          srcSize: Vector2(187, 187),
        ),
      ),
    );

    final buttonsStart = _logo.position.y + (_logo.size.y / 2) + 30;

    add(
      _scoreText = TextComponent(
        position: Vector2(gameRef.size.x / 2, buttonsStart - 35),
        textRenderer: gameRef.renderer,
        text: 'HI ${gameRef.highscore}',
        priority: 2,
        anchor: Anchor.center,
      ),
    );

    final spaceAvailable = gameRef.size.y - buttonsStart;
    final buttonHeight = spaceAvailable / 3 - 15;

    add(
      _playButton = _PlayButton(
        height: buttonHeight,
        position: Vector2(
          gameRef.size.x / 2,
          buttonsStart,
        ),
      ),
    );
    add(
      _creditsButton = _CreditsButton(
        height: buttonHeight,
        position: Vector2(
          gameRef.size.x / 2,
          _playButton.position.y + _playButton.size.y + 15,
        ),
      ),
    );
    add(
      _exitButton = _ExitButton(
        height: buttonHeight,
        position: Vector2(
          gameRef.size.x / 2,
          _creditsButton.position.y + _creditsButton.size.y + 15,
        ),
      ),
    );
  }

  void dismiss() {
    const duration = .8;
    _topBorder.add(
      MoveEffect.to(
        Vector2(0, -_topBorder.size.y),
        CurvedEffectController(duration, Curves.bounceIn),
      ),
    );

    _bottomBorder.add(
      MoveEffect.to(
        Vector2(0, gameRef.size.y),
        CurvedEffectController(duration, Curves.bounceIn),
      ),
    );

    _overlay.add(
      OpacityEffect.to(
        0,
        CurvedEffectController(duration, Curves.easeIn),
      ),
    );

    _logo.addAll([
      RotateEffect.to(
        pi * 4,
        CurvedEffectController(duration, Curves.easeIn),
      ),
      ScaleEffect.to(
        Vector2.zero(),
        CurvedEffectController(duration, Curves.easeIn),
      ),
    ]);

    _scoreText.addAll([
      RotateEffect.to(
        -pi * 8,
        CurvedEffectController(duration, Curves.easeIn),
      ),
      ScaleEffect.to(
        Vector2.zero(),
        CurvedEffectController(duration, Curves.easeIn),
      ),
    ]);

    _playButton.add(
      MoveEffect.to(
        Vector2(gameRef.size.x + _playButton.size.x / 2, _playButton.y),
        CurvedEffectController(duration / 2, Curves.easeIn),
      ),
    );

    _creditsButton.add(
      MoveEffect.to(
        Vector2(-_playButton.size.x, _creditsButton.y),
        CurvedEffectController(duration / 2, Curves.easeIn),
      ),
    );

    _exitButton.add(
      MoveEffect.to(
        Vector2(gameRef.size.x + _exitButton.size.x / 2, _exitButton.y),
        CurvedEffectController(duration / 2, Curves.easeIn),
      ),
    );

    Future.delayed(Duration(milliseconds: (1000 * duration).toInt()), () {
      gameRef.state = GameState.intro;
      removeFromParent();
    });
  }
}

class _Border extends PositionComponent with HasGameRef<DashingVikingGame> {
  _Border([this.bottom = false])
      : super(
          priority: 2,
        );

  final bool bottom;

  @override
  Future<void> onLoad() async {
    size = gameRef.size.clone()
      ..multiply(
        Vector2(
          1,
          .35,
        ),
      );

    add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xfff7f7f7),
      ),
    );

    if (bottom) {
      position.y = gameRef.size.y - size.y;
    }

    final borderSprite = Sprite(
      gameRef.spriteTitle,
      srcPosition: Vector2(192, 0),
      srcSize: Vector2(16, 31),
    );

    final borderHeight = size.y * 0.2;
    final segmentWidth = borderHeight / 2;

    for (var i = 0; i < (gameRef.size.x ~/ segmentWidth) + 1; i++) {
      add(
        SpriteComponent(
          sprite: borderSprite,
          size: Vector2(segmentWidth + segmentWidth * 0.01, borderHeight),
          position: Vector2(
            i * segmentWidth,
            bottom ? 0 : size.y - borderHeight,
          ),
        ),
      );
    }
  }
}

class _Button extends PositionComponent
    with HasGameRef<DashingVikingGame>, TapCallbacks {
  _Button({super.position, required double height})
      : super(
          priority: 2,
          anchor: Anchor.topCenter,
          size: Vector2(204 * (height / 84), height),
        );

  late final Sprite sprite;
  late final VoidCallback onTap;

  @override
  bool onTapDown(TapDownEvent event) {
    onTap();
    return true;
  }

  @override
  void render(Canvas canvas) {
    sprite.render(canvas, size: size);
  }
}

class _PlayButton extends _Button {
  _PlayButton({super.position, required super.height});

  @override
  Future<void> onLoad() async {
    sprite = Sprite(
      gameRef.spriteTitle,
      srcPosition: Vector2(240, 5),
      srcSize: Vector2(112, 57),
    );

    onTap = () {
      gameRef.firstChild<TitleOverlay>()?.dismiss();
    };
  }
}

class _CreditsButton extends _Button {
  _CreditsButton({super.position, required super.height});

  @override
  Future<void> onLoad() async {
    sprite = Sprite(
      gameRef.spriteTitle,
      srcPosition: Vector2(240, 133),
      srcSize: Vector2(112, 57),
    );

    onTap = () {
      showDialog(
        context: gameRef.buildContext!,
        builder: (_) => const CreditsDialog(),
      );
    };
  }
}

class _ExitButton extends _Button {
  _ExitButton({super.position, required super.height});

  @override
  Future<void> onLoad() async {
    sprite = Sprite(
      gameRef.spriteTitle,
      srcPosition: Vector2(240, 69),
      srcSize: Vector2(112, 57),
    );

    onTap = () {
      gameRef.navigateBack();
    };
  }
}
