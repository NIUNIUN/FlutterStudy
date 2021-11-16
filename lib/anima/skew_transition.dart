import 'dart:math';

import 'package:flutter/material.dart';

/**
 * 自定义转场动画。
 * 在build 方法中返回一个 Transform 对象即可，通过这种方式可以做自定义的转场动画效果。
 *
 * 例如：使用 Matrix4 的 skew 方法，在x 和 y 轴进行变形，得到类似卡片变形的效果。
 *
 */
class SkewTransition extends AnimatedWidget {
  const SkewTransition(
      {Key? key,
      required Animation<double> turns,
      this.alignment = Alignment.center,
      required this.child})
      : super(key: key, listenable: turns);

  final Alignment alignment;
  final Widget child;

  Animation<double> get turns => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform =
        Matrix4.skew(turnsValue * pi * 2.0, turnsValue * pi * 2.0);
    return Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}
