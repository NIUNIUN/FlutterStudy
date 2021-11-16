import 'package:flutter/cupertino.dart';
import 'package:fluttermyapp/bnb_app.dart';
import 'package:fluttermyapp/bnb_dynamic_detail.dart';
import 'package:fluttermyapp/bnb_login.dart';
import 'package:fluttermyapp/bnb_not_found.dart';
import 'package:fluttermyapp/dnd_splash.dart';

/**
 * 全部使用静态属性和静态方法，无需反复构建对象。
 * App 的所有页面都可以通过这个类集中管理，从而避免多处维护。
 */
class RouterTable {
  static String splashPath = "splash";
  static String loginPath = 'login';
  static String homePath = '/';
  static String notFoundPath = '404';
  static String dynamicDetail = 'dynamic_detail';

  static Map<String, WidgetBuilder> routeTable = {
    splashPath: (context) => SplashPage(),
    notFoundPath: (context) => NotFound(),
    loginPath: (context) => LoginPage(),
    homePath: (context) => AppHomePage(),
    dynamicDetail: (context) => DynamicDetail("")
  };

  // 路由拦截
  static Route onGenerateRoute<T extends Object>(RouteSettings settings) {
    // arguments 可能为任意类型，因此可能会导致转换失败。实际业务中最好是约定路由参数传递类型，避免参数形式不同意导致异常出现。
    var arguments = settings.arguments as Map<String, dynamic>;
    if (arguments != null) {
      arguments['event'] = '路由拦截增加的参数';
    }

    RouteSettings newSetting =
        settings.copyWith(name: settings.name, arguments: arguments);

    return CupertinoPageRoute<T>(
      settings: newSetting,
      builder: (context) {
        // settings.arguments  携带路由参数。 name:包含路由路径名称。
        String name = settings.name ?? "";
        if (routeTable[name] == null) {
          name = notFoundPath;
        }
        Widget widget = routeTable[name]!(context);
        return widget;
      },
    );
  }
}
