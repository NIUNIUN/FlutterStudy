import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermyapp/bnb_category.dart';
import 'package:fluttermyapp/bnb_dynamic.dart';
import 'package:fluttermyapp/bnb_message.dart';
import 'package:fluttermyapp/bnb_mine.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int _index = 0;

  List<Widget> _homeWidget = [
    DynamicPage(),
    MessagePage(),
    CategoryPage(),
    MinePage()
  ];

  _onBottomNavigationBarTapped(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "岛上孤独",
        //     style: Theme.of(context).textTheme.bodyText1,
        //   ),
        //   backgroundColor: Colors.green,
        //   foregroundColor: Colors.deepPurple,
        //   shadowColor: Colors.red,
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Colors.lime,
        //     statusBarBrightness: Brightness.light,
        //   ),
        // ),
        body: IndexedStack(
          index: _index,
          children: _homeWidget,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _index,
            onTap: _onBottomNavigationBarTapped,
            items: [
              _getBottomNavItem("动态", 'images/ic_device_checked.png',
                  'images/ic_device_normal.png', 0),
              _getBottomNavItem("消息", 'images/ic_found_checked.png',
                  'images/ic_found_normal.png', 1),
              _getBottomNavItem("分类浏览", 'images/ic_home_checked.png',
                  'images/ic_home_normal.png', 2),
              _getBottomNavItem("个人中心", 'images/ic_personal_center_checked.png',
                  'images/ic_personal_center_normal.png', 3),
            ]),
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavItem(
      String title, String pressedIcon, String normalIcon, int index) {
    return BottomNavigationBarItem(
        icon: _index == index
            ? Image.asset(
                pressedIcon,
                width: 32,
                height: 28,
              )
            : Image.asset(
                normalIcon,
                width: 32,
                height: 28,
              ),
        label: title);
  }
}
