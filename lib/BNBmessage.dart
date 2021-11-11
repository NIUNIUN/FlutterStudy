// ignore: file_names
// 项目业务代码 —— 消息
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  int selectIndex =
                      await _showBasicModalBottomSheet(context, _basicData());
                },
                child: Text('基础底部弹框')),
            SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {}, child: Text('全屏底部弹框')),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  _showCustomModalBottomSheet(
                      context,  _basicData());
                },
                child: Text('自定义底部弹框')),
          ],
        ),
      ),
    );
  }

  List<String> _basicData() {
    List<String> data = List.filled(10, "");
    for (int i = 0; i < 10; i++) {
      data[i] = 'options' + i.toString();
    }
    return data;
  }

  Future _showBasicModalBottomSheet(
      BuildContext context, List<String> options) async {
    return showModalBottomSheet(
        // isScrollControlled 是否全屏显示。true-全屏显示；默认false。
        isScrollControlled: false,
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(options[index]),
                onTap: () {
                  Navigator.of(context).pop(index);
                },
              );
            },
            itemCount: options.length,
          );
        });
  }

  Future _showCustomModalBottomSheet(context, List<String> options) async {
    return showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
            ),
          ),

          // MediaQuery.of(context).size属性 获取屏幕的尺寸
          height: MediaQuery.of(context).size.height / 2.0,
          child: Column(children: [
            SizedBox(
              height: 50,
              child: Stack(
                textDirection: TextDirection.rtl,
                children: [
                  Center(
                    child: Text(
                      '底部弹窗',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
            Divider(height: 1.0),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(options[index]),
                      onTap: () {
                        Navigator.of(context).pop(index);
                      });
                },
                itemCount: options.length,
              ),
            ),
          ]),
        );
      },
    );
  }

/** 底部弹出框  bottom_sheet.dart 中 定义
 * showBottomSheet()  局部覆盖
 * showModalBottomSheet() 全局覆盖
 */
// void showModalBottomSheet({backgroundColor:Colors.transparent,isScrollControlled:bool,context:BuildContext}){
//
// }
}
