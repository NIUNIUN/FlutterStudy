// 作为入口文件，应当做最基础的配置和全局初始化配置，不应该有业务代码。
import 'package:flutter/material.dart';
import 'package:fluttermyapp/bnb_app.dart';
import 'package:fluttermyapp/components/bnb_router_manager.dart';
import 'package:fluttermyapp/components/bnb_router_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    RouterManager.initRouter();

    return MaterialApp(
      title: "App 框架",
      theme: ThemeData(
          primaryColor: Colors.green,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            headline3: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            headline4: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            headline6: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black),
            bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ),
          fontFamily: 'Georgia'),
      // navigatorKey: navigationKey,

      // 使用 原生的路由
      // onGenerateRoute: RouterTable.onGenerateRoute,

      // 使用 fluro 路由插件。
      onGenerateRoute: RouterManager.router!.generator,

      // 为什么不指定启动页，能够直接是调用 SplashPage呢？
      // home: SafeArea(child: AppHomePage()),
    );
  }
/**
 *  MaterialApp(
    //其他参数...
    navigatorKey: //全局导航状态Key， 用于全局存储导航的状态。
    onGenerateRoute: //路由改变响应方法。为路由拦截，当路由发生改变时，该方法会被调用，从而可以根据路由参数返回不同的也买你，或者进行路由拦截、
    initialRoute: //初始化路由路径，一般为启动页或首页的路径。
    );

 */
}
