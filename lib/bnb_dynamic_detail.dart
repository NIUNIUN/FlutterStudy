import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicDetail extends StatelessWidget {
  final String id;

  const DynamicDetail(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context).settings 就是 onGenerateRoute 的 setting 参数/
    // Map<String, dynamic> routeParams =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("动态详情"),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),

        // body: Center(child: Text("产品ID：${routeParams['id']}")),

        body: Center(child: Text("产品ID：${id}")),
      ),

      // onWillPop 返回前拦截处理。true，返回上一级；false，不会返回。
      onWillPop: () async {
        // 数据返回上一页面。实际过程中一般是往下级传递路由参数，需要尽量避免来回传参数来实现数据传递导致上下级页面耦合严重，最好通过状态管理实现。
        // Navigator.of(context).pop({'id': routeParams['id']});
        Navigator.of(context).pop({'id': id});
        return true;
      },
    );
    return Container();
  }
}
