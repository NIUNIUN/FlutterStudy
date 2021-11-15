import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("404"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(child: Text('404!抱歉，页面没有找到。')),
    );
  }
}
