// 项目业务代码 —— 分类浏览

import 'package:flutter/material.dart';
import 'package:fluttermyapp/BNB_login.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed:(){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginPage()));
        }, child: Text("分类浏览")),
      ),
    );
  }

  // Function _Pressed = (BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => LoginPage()));
  // };
}
