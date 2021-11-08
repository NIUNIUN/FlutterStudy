// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("测试 build");

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? "Activie" : "Inactive",
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo"),
        ),
        body: const Center(
          child: TapboxA(),
        ),
      ),
    );
  }
}

void fullname(String fistName, {String lastName = "f"}) {}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> user)
      : name = user['name'],
        email = user['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

class Dog {
  String _name = "";
  int age = 10;

  Dog(this._name, this.age);

  Dog.newBorn() {
    _name = 'Doggy';
    age = 0;
  }
}

class Pug extends Dog {
  Pug(String name, int age) : super(name, age);

  Pug.newBorn() : super.newBorn();
}

void main() {
  runApp(MyApp());
}
