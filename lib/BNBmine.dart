//项目业务代码 —— 个人中心

import 'package:flutter/material.dart';
import 'package:fluttermyapp/BNBmine_mock_data.dart';

class MinePage extends StatelessWidget {
  static const double MARGIN = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _headerGridButton(),
          _dynamicGridButtons(MineMockData.financeGrids(), "金融理财"),
          _dynamicGridButtons(MineMockData.serviceGrids(), "生活服务"),
          _dynamicGridButtons(MineMockData.thirdpartyGrids(), "交通出行"),
          _dynamicGridButtons(MineMockData.shoppingGrids(), "购物消费"),
        ],
      ),
    );
  }

  Widget _headerGridButton() {
    List<Map<String, String>> buttons = MineMockData.headerGrids();
    return Container(
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
    );
  }

  Widget _dynamicGridButtons(List<Map<String, String>> buttons, String title,
      {int crossAxisCount = 4}) {
    return Container(
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
          _gridButtons(buttons, crossAxisCount, textColor: Colors.black),
        ],
      ),
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
