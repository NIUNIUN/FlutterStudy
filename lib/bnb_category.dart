// 项目业务代码 —— 分类浏览

import 'package:flutter/material.dart';
import 'package:fluttermyapp/bnb_login.dart';
import 'package:fluttermyapp/components/bnb_router_manager.dart';
import 'package:fluttermyapp/components/bnb_router_table.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(RouterTable.loginPath);

                  // 使用 fluro 路由插件
                  RouterManager.router!
                      .navigateTo(context, RouterManager.loginPath);
                },
                child: const Text("登录")),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouterTable.notFoundPath);
                },
                child: Text('404')),
          ],
        ),
      ),
    );
  }

// Function _Pressed = (BuildContext context) {
//   Navigator.of(context)
//       .push(MaterialPageRoute(builder: (context) => LoginPage()));
// };
}
