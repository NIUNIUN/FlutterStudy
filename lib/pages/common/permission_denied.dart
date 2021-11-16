import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PermissionDenied extends StatelessWidget {
  const PermissionDenied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Center(
        child: Text('403！ 抱歉，您无权限访问该功能'),
      ),
    );
  }
}
