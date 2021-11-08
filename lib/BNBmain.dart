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
      theme: ThemeData(primaryColor: Colors.red),
      home: AppHomePage(),
    );
  }
}
