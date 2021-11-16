import 'package:flutter/material.dart';
import 'package:fluttermyapp/anima/skew_transition.dart';

/**
 * 转场动画
 */
class RouterTransition {
  /**
   * 逆时针围绕中心旋转
   *
   * turns：动画控制，表示旋转的弧度书，等于动画控制值乘以2Π。
   * alignment：表示旋转围绕的中心位置，默认据中国。
   *
   * 旋转弧度不要太大，否则动画过快，不好看。推荐起始值：0.2~0.3之间。 结束值为0 表示回到正常位置。
   *
   * 起始值为负数，则是顺时针；正数，则是逆时针
   */
  static var rotationTransition = (BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return RotationTransition(
      turns: Tween<double>(begin: 0.25, end: 0.0).animate(animation),
      child: child,
    );
  };

  /**
   * 顺时针围绕左下角旋转
   */
  static var rotationTransitionClockwise = (BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return RotationTransition(
      alignment: Alignment.bottomLeft,
      turns: Tween<double>(begin: -0.25, end: 0.0).animate(animation),
      child: child,
    );
  };

  /**
   * 缩放转场动画
   */
  static var scaleTransition = (BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
      child: child,
    );
  };

  /**
   * 自定义转场动画—— 卡片变形
   */
  static var skewTransition = (BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SkewTransition(
        turns: Tween<double>(begin: -0.05, end: 0.0).animate(animation),
        child: child);
  };
}
