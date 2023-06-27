import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';

import 'background/horizon.dart';
import 'game_over.dart';
import 'gear_manager.dart';
import 'player.dart';
import 'title_overlay.dart';

enum GameState { playing, intro, gameOver, waiting }

class DashingVikingGame extends FlameGame
    with KeyboardEvents, TapCallbacks, HasCollisionDetection {
  DashingVikingGame({
    required this.navigateBack,
    required this.persistScore,
    required int highscore,
  }) : _highscore = highscore;

  late final Image spriteImage;
  late final Image spriteTitle;
  final void Function(int) persistScore;

  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  late final player = Player();
  late final horizon = Horizon();
  late final gameOverPanel = GameOverPanel();
  late final TextComponent scoreText;
  late final TextRenderer renderer;
  final VoidCallback navigateBack;

  int _score = 0;
  int _highscore = 0;
  int get highscore => _highscore;
  int get score => _score;
  set score(int newScore) {
    _score = newScore;
    scoreText.text = '${scoreString(_score)}  HI ${scoreString(_highscore)}';
  }

  String scoreString(int score) => score.toString().padLeft(5, '0');

  /// Used for score calculation
  double _distanceTravelled = 0;

  @override
  Future<void> onLoad() async {
    spriteImage = await Flame.images.load('games/dashing_vikings/sprites.png');
    spriteTitle = await Flame.images.load('games/dashing_vikings/title.png');
    add(horizon);
    add(player);
    add(gameOverPanel);

    const chars = '0123456789HI ';
    renderer = SpriteFontRenderer.fromFont(
      SpriteFont(
        source: spriteImage,
        size: 23,
        defaultCharWidth: 20,
        glyphs: [
          for (var i = 0; i < chars.length; i++)
            Glyph(chars[i], left: 954.0 + 20 * i, top: 0)
        ],
        ascent: 23,
        // letterSpacing: 2,
      ),
    );
    add(
      scoreText = TextComponent(
        position: Vector2(20, 40),
        textRenderer: renderer,
      )..positionType = PositionType.viewport,
    );
    score = 0;
    add(TitleOverlay());
    add(GearManager());
  }

  GameState state = GameState.waiting;
  double currentSpeed = 0.0;
  double timePlaying = 0.0;

  final double acceleration = 10;
  final double maxSpeed = 2500.0;
  final double startSpeed = 600;

  bool get isPlaying => state == GameState.playing;
  bool get isGameOver => state == GameState.gameOver;
  bool get isIntro => state == GameState.intro;
  bool get isWaiting => state == GameState.waiting;

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (keysPressed.contains(LogicalKeyboardKey.enter) ||
        keysPressed.contains(LogicalKeyboardKey.space)) {
      onAction();
    }
    return KeyEventResult.handled;
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    if (!isWaiting) {
      onAction();
    }
  }

  void onAction() {
    if (isGameOver || isIntro) {
      restart();
      return;
    }
    if (isPlaying) {
      player.jump(currentSpeed);
    }
  }

  void gameOver() {
    gameOverPanel.visible = true;
    state = GameState.gameOver;
    player.current = PlayerState.crashed;
    currentSpeed = 0.0;
  }

  void restart() {
    state = GameState.playing;
    player.resetMatch();
    horizon.reset();
    currentSpeed = startSpeed;
    gameOverPanel.visible = false;
    timePlaying = 0.0;
    if (score > _highscore) {
      _highscore = score;
      persistScore(_highscore);
    }
    score = 0;
    _distanceTravelled = 0;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isGameOver) {
      return;
    }

    if (isPlaying) {
      timePlaying += dt;
      _distanceTravelled += dt * currentSpeed;
      score = _distanceTravelled ~/ 50;

      if (currentSpeed < maxSpeed) {
        currentSpeed += acceleration * dt;
      }
    }
  }
}
