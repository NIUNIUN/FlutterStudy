//项目业务代码 —— 个人中心

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermyapp/bnb_mine_mock_data.dart';

class MinePage extends StatelessWidget {
  static const double MARGIN = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          // 滚动方向
          scrollDirection: Axis.vertical,
          // 表示反转滚动。 垂直方向：滚动方向改为向上；水平方向：改为向左
          reverse: false,
          slivers: [
            _getAppBar(context, "个人中心"),
            _headerGridButton(),
            _getMenuTitle("金融理财"),
            _sliverGridButtons(MineMockData.financeGrids(), 4),
            _getMenuTitle("生活服务"),
            _sliverGridButtons(MineMockData.serviceGrids(), 4),
            _getMenuTitle("交通出行"),
            _sliverGridButtons(MineMockData.thirdpartyGrids(), 4),
            _getMenuTitle("购物消费"),
            _sliverGridButtons(MineMockData.shoppingGrids(), 4),
            // _dynamicGridButtons(MineMockData.financeGrids(), "金融理财"),
            // _dynamicGridButtons(MineMockData.serviceGrids(), "生活服务"),
            // _dynamicGridButtons(MineMockData.thirdpartyGrids(), "交通出行"),
            // _dynamicGridButtons(MineMockData.shoppingGrids(), "购物消费"),
          ],
        ),
      ),
    );
  }

  SliverAppBar _getAppBar(BuildContext context, String title) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      // pinned: 滚动到顶部后，导航了是否可见。默认：false，不可见。
      pinned: true,
      // floating:浮动，即便是滚动试图不在顶部，也会跟随滚动出来。默认：false，不会跟随滚动出现。
      floating: false,

      expandedHeight: 230,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),

        // Android 和 iOS 标题栏会有所差别。Android 中标题居左，iOS 中标题居中。可以设置 centerTitle。
        centerTitle: true,
        background: CachedNetworkImage(
          imageUrl:
              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=688497718,308119011&fm=26&gp=0.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _headerGridButton() {
    List<Map<String, String>> buttons = MineMockData.headerGrids();
    return SliverToBoxAdapter(
      child: Container(
        height: 144,
        margin: EdgeInsets.fromLTRB(MARGIN, MARGIN, MARGIN, MARGIN / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF56AF6D), Color(0xFF56AA6D)])),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buttons
                .map((item) => _getMenu(item['icon'] ?? "", item['name'] ?? "",
                    color: Colors.white))
                .toList(),
          ),
        ),
      ),
    );
  }

  /**
   * Container中使用SliverGrid会报错。暂时不知道什么原因，暂时这样理解：sliver家族的组件必须在CustomScrollView中作为直接子widget使用。
   */
  Widget _dynamicGridButtons(List<Map<String, String>> buttons, String title,
      {int crossAxisCount = 4}) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.fromLTRB(MARGIN, MARGIN, MARGIN, MARGIN),
        padding: EdgeInsets.all(MARGIN),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey)],
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.grey[700])),
            SizedBox(
              height: 20,
            ),
            // _gridButtons(buttons, crossAxisCount, textColor: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _getMenuTitle(String title) {
    return SliverToBoxAdapter(
        child: Container(
      margin: EdgeInsets.fromLTRB(MARGIN, MARGIN, MARGIN, MARGIN / 2),
      padding: EdgeInsets.all(MARGIN),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.white,
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey[700]),
      ),
    ));
  }

  SliverGrid _sliverGridButtons(
      List<Map<String, String>> buttons, int crossAxiscount,
      {Color textColor = Colors.black54}) {
    double gridSpace = 5.0;
    return SliverGrid.count(
      crossAxisCount: crossAxiscount,
      crossAxisSpacing: gridSpace,
      mainAxisSpacing: gridSpace,
      children: buttons.map((item) {
        return _getMenu(item['icon'] ?? "", item['name'] ?? "",
            color: textColor);
      }).toList(),
    );
  }

  GridView _gridButtons(List<Map<String, String>> buttons, int crossAxiscount,
      {Color textColor = Colors.white}) {
    double gridSpace = 5.0;
    return GridView.count(
      crossAxisCount: crossAxiscount,
      crossAxisSpacing: gridSpace,
      mainAxisSpacing: gridSpace,

      // 设置 shrinkWrap 和 physics 参数：停止 GridView 的滚动，防止与 ListView 冲突
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: buttons.map((item) {
        return _getMenu(item['icon'] ?? "", item['name'] ?? "",
            color: textColor);
      }).toList(),
    );
  }

  Widget _getMenu(String icon, String title, {Color color = Colors.black}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Image.asset(icon),
          width: 50,
          height: 50,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: color, height: 1),
        )
      ],
    );
  }
}
