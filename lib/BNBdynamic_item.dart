// 构建列表元素
import 'dart:ui';

import 'package:flutter/material.dart';

class DynamicItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int viewCount;

  static const double ITEM_HEIGHT = 100;
  static const double TITLE_HEIGHT = 80;
  static const double MARGIN_SIZE = 10;

  DynamicItem(this.imageUrl, this.title, this.viewCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

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
