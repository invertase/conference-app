import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';

class BlowToKingdomComeEffect extends Component with HasGameRef {
  @override
  Future<void> onLoad() async {
    assert(parent is PositionComponent);

    final positionComponent = parent as PositionComponent;

    final rng = Random();
    final destination =
        ((gameRef.size + positionComponent.size) * rng.nextDouble())
          ..multiply(
            Vector2(
              rng.nextBool() ? 1 : -1,
              rng.nextBool() ? 1 : -1,
            ),
          );

    const duration = .8;

    positionComponent.anchor = Anchor.center;
    positionComponent.addAll(
      [
        RotateEffect.to(pi * 6, LinearEffectController(duration)),
        MoveEffect.to(destination, LinearEffectController(duration)),
      ],
    );

    Future.delayed(Duration(milliseconds: (1000 * duration).toInt()), () {
      removeFromParent();
      positionComponent.removeFromParent();
    });
  }
}
