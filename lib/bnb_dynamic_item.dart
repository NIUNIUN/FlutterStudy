// 构建列表元素
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttermyapp/components/bnb_router_table.dart';

class DynamicItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String title;
  final int viewCount;

  static const double ITEM_HEIGHT = 100;
  static const double TITLE_HEIGHT = 80;
  static const double MARGIN_SIZE = 10;

  DynamicItem(this.id, this.imageUrl, this.title, this.viewCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(MARGIN_SIZE),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageWrapper(imageUrl),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleWrapper(context, title),
                  _viewCountWrapper(viewCount.toString())
                ],
              ),
            ),
            // ),
          ],
        ),
      ),
      onTap: () async {
        Map<String, dynamic> routeParams = {'id': id};

        // 接收等待 返回值
        var arguments = await Navigator.of(context)
            .pushNamed(RouterTable.dynamicDetail, arguments: routeParams);

        // Snacbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('从动态${(arguments as Map<String, dynamic>)['id']}返回'),
          ),
        );
      },
    );
  }

  /**
   * 使用网络缓存
   */
  Widget _imageWrapper(String imageUrl) {
    return SizedBox(
      height: ITEM_HEIGHT,
      width: 150,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        // 进度条和占位符不能同时使用
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
              // 包装一个widget，否则宽高为父widget的值
              child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ));
        },
        // placeholder: (context, url) => Image.asset('images/ic_device.png'),
        errorWidget: (context, url, error) =>
            Icon(Icons.error, color: Colors.red),
        fit: BoxFit.fill,
      ),
    );
  }

/*  // Image.network：没有缓存功能；体验功能不好。
  Widget _imageWrapper(String imageUrl) {
    return SizedBox(
      height: ITEM_HEIGHT,
      width: 150,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
*/

  Widget _titleWrapper(BuildContext context, String title) {
    return Container(
      height: TITLE_HEIGHT,
      padding: EdgeInsets.fromLTRB(MARGIN_SIZE, 0, 0, 0),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _viewCountWrapper(String text) {
    return Container(
        height: ITEM_HEIGHT - TITLE_HEIGHT,
        padding: EdgeInsets.fromLTRB(MARGIN_SIZE, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.remove_red_eye_outlined,
              size: 14,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ));
  }
}
