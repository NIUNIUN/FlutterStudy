import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/**
 * 跳转时拦截。
 */
class PermissionRouter extends FluroRouter {
  // 白名单路由路径
  late List<String> _whiteList;

  set whiteList(value) => _whiteList = value;

  // 拦截后跳转的路由路径
  late String _permissionDeniedPath;

  set permissionDeniedPath(value) => _permissionDeniedPath = value;

  @override
  Future navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool maintainState = true,
    bool rootNavigator = false,
    TransitionType? transition,
    Duration? transitionDuration,
    transitionBuilder,
    RouteSettings? routeSettings,
  }) {
    String pathToNavigate = path;

    // AppRouteMatch 类有一个 AppRoute 类 route 属性，route 属性下有一个字符串类型的 route 属性，即匹配到的路由路径。
    AppRouteMatch? routeMatch = this.match(path);

    String? routePathMatched = routeMatch?.route?.route;
    if (routePathMatched != null) {
      // 设置了白名单并且当前路由不在白名单内，更改路由路径到授权被拒绝页面
      if (_whiteList != null && !_whiteList.contains(routePathMatched)) {
        pathToNavigate = _permissionDeniedPath;
      }
    }

    return super.navigateTo(context, pathToNavigate,
        replace: replace,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        routeSettings: routeSettings);
  }
}
