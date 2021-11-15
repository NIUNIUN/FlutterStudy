// 项目业务页面 —— 动态
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttermyapp/bnb_dynamic_item.dart';
import 'package:fluttermyapp/bnb_dynamic_mock_data.dart';

/*   // 静态数据
class DynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: DynamicMockData.list(1, 20).map((Map<String, dynamic> map) {
          return DynamicItem(map['imageUrl'], map['title'], map['viewCount']);
        }).toList(),
      ),
    );
  }
}
*/

// 动态数据，有状态，可下拉刷新，上拉加载
class DynamicPage extends StatefulWidget {
  const DynamicPage({Key? key}) : super(key: key);

  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  static const int PAGE_SIZE = 10;
  List<Map<String, dynamic>> _listItems = [];
  int _currentPage = 0;

  void _refresh() async {
    _currentPage = 1;
    _requestNetworkItems();
  }

  void _load() async {
    _currentPage += 1;
    _requestNetworkItems();
  }

  void _requestNetworkItems() async {
    List<Map<String, Object>> _newItems =
        await DynamicMockData.list(_currentPage, PAGE_SIZE);

    setState(() {
      // 赋值操作都是一样的，为什么要添加 if 判断 条件？
      if (_currentPage > 1) {
        _listItems += _newItems;
      } else {
        _listItems = _newItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        firstRefresh: true,
        onRefresh: () async {
          _refresh();
        },
        onLoad: () async {
          _load();
        },
        child: ListView.builder(
            itemCount: _listItems.length,
            itemBuilder: (context, index) {
              return DynamicItem(index, _listItems[index]['imageUrl'],
                  _listItems[index]['title'], _listItems[index]['viewCount']);
            }),
      ),
    );
  }
}
