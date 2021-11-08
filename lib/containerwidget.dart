import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "图片示例",
    home: Scaffold(
      appBar: AppBar(title: Text("title")),
      body: _buildImageColumn(),
    ),
  ));
}

Widget _buildImageColumn() {
  return Container(
    height: 200,
    decoration: const BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      children: [
        _buildImageRow(1),
        _buildImageRow(3),
      ],
    ),
  );
}

Widget _buildDecoratedImage(int imageIndex) => Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.redAccent),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        margin: const EdgeInsets.all(4),
        child: Icon(
          Icons.ac_unit_rounded,
          color: Colors.orange[200],
        ),
      ),
    );

Widget _buildImageRow(int imageIndex) => Row(
      children: [
        _buildDecoratedImage(imageIndex),
        _buildDecoratedImage(imageIndex + 1),
      ],
    );
