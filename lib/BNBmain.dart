// 作为入口文件，应当做最基础的配置和全局初始化配置，不应该有业务代码。
import 'package:flutter/material.dart';
import 'package:fluttermyapp/BNBApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                fontSize: 14, fontWeight: FontWeight.w200, color: Colors.white),
            bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ),
          fontFamily: 'Georgia'),
      home: AppHomePage(),
    );
  }
}
