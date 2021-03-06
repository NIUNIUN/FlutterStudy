import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttermyapp/bnb_app.dart';
import 'package:fluttermyapp/bnb_dynamic_detail.dart';
import 'package:fluttermyapp/bnb_login.dart';
import 'package:fluttermyapp/pages/common/bnb_not_found.dart';
import 'package:fluttermyapp/dnd_splash.dart';
import 'package:fluttermyapp/pages/common/permission_denied.dart';

/**
 * Fluro 默认会把路径'/'当作根目录，因此必须定义根目录的 Handler。另外对于路由不存在的情况，可以设置 FluroRouter.notFoundHandler 定义错误路由处理器。
 */
class RouterManager {
  static String splashPath = "/";
  static String loginPath = '/login';
  static String homePath = '/home';
  static String dynamicPath = '/dynamic';
  static String dynamicDetailPath = '$dynamicPath/:id';

  static FluroRouter? router;

  static void initRouter() {
    if (router == null) {
      router = FluroRouter();
    }
    defineRoutes(whiteList: [splashPath, homePath, dynamicDetailPath]);
  }

  /**
   *  fluro 的关键实现是 Handler：
   *    一个是 HandlerType 枚举，分为 router 和 function。
   *    handlerFunc 是响应路由的方法，需要返回Widget，跳转到对应的页面。
   *    HandlerFunc 接收context 和路由参数——类型是Map,对应路由路径的多个路由参数。
   *      例如：/dynamic/:id 路由，如果实际路由为 /dynamic/1?event=a&event=b,则 parameters 的格式如下：：
   *        {
   *          “id”:["1"],
   *          "event":["a"，“b”]
   *        }
   *
   *   页面跳转有多种形式，举例三种：
   *      - 清除路由堆栈跳转：即跳转后的页面作为根页面（没有返回按钮），适合闪屏页跳转到首页，代码如下：
   *        RouterManager.router.navigateTo(context, RouterManager.homePath, clearStack: true);
   *      - 普通跳转：无参数直接跳转，代码如下：
   *        RouterManager.router.navigateTo(context, RouterManager.loginPath);
   *      - 带参数跳转：路由路径携带参数，和普通跳转类型，直接拼接了路径参数和 query参数，代码如下：
   *        RouterManager.router.navigateTo(context, '${RouterManager.dynamicPath}/$id?event=a&event=b')
   */

  // 完整路由表
  static final routeTable = {
    splashPath: Handler(handlerFunc:
        (BuildContext? context, Map<String, List<String>> parameters) {
      return SplashPage();
    }),
    loginPath: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return LoginPage();
    }),
    dynamicDetailPath: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return DynamicDetail(params['id']![0]);
    }),
    homePath: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return AppHomePage();
    })
  };

/*

  static var splashHandler = Handler(handlerFunc:
      (BuildContext? context, Map<String, List<String>> parameters) {
    return SplashPage();
  });

  static var loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return LoginPage();
  });

  static var dynamicDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return DynamicDetail(params['id']![0]);
  });

  static var homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return AppHomePage();
  });
*/

  static var notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return NotFound();
  });

  // 未授权页面处理
  static final permissionDeniedHandle = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return PermissionDenied();
  });

  /**
   * 定义路由。
   * 添加路由时，将路由路径与白名单进行对比，若不在白名单内，则使用未授权路由处理器。
   *
   */
  static void defineRoutes({List<String>? whiteList}) {
    routeTable.forEach((path, handler) {
      if (null == whiteList || whiteList.contains(path)) {
        router!.define(path, handler: handler);
      } else {
        router!.define(path,
            handler: permissionDeniedHandle,
            transitionType: TransitionType.material);
      }
    });
/*
    // transitionType 指定转场方式；transitionDuration 动画时长，一般转场动态建议在200-300毫秒之间。
    router!.define(
      loginPath,
      handler: loginHandler,

      // 转场动画
      transitionType: TransitionType.custom,

      // 逆时针围绕中心旋转
      transitionBuilder: RouterTransition.skewTransition,
    );*/

    // router!.notFoundHandler：
    router!.notFoundHandler = notFoundHandler;
  }
}
