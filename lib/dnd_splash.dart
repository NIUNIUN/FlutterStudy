import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttermyapp/anima/router_transition.dart';
import 'package:fluttermyapp/components/bnb_router_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CachedNetworkImage(
            imageUrl:
                "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=688497718,308119011&fm=26&gp=0.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      Timer(const Duration(milliseconds: 2000), () {
        RouterManager.router!.navigateTo(context, RouterManager.homePath,
            clearStack: true,
            // transition: TransitionType.fadeIn,   // 渐变
            transition: TransitionType.custom, // 自定义
            transitionBuilder: RouterTransition.scaleTransition, // 缩放
            transitionDuration: Duration(milliseconds: 1500));

        //Navigator.of(context).pushReplacementNamed(RouterTable.homePath);
      });
    }
  }
}
