import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
        backgroundColor: Colors.amberAccent,
      ),
      body: _buildStack(),
    ),
  ));
}

Widget _buildStack() {
  return Stack(

    // 对齐，Alignment(0,0) 表示矩形的中心。
    alignment: const Alignment(1,1),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('images/pic.jpg'),
        radius: 100,
      ),
      Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: const Text(
          'Mia B',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.purpleAccent,
          ),
        ),
      )
    ],
  );
}
