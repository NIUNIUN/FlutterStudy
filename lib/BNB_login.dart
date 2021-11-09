import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getRoundImage("image/logo.png", 100.0),
            SizedBox(height: 60),
            SizedBox(height: 10),
            _getUsernameInput(),
            _getPasswordInput(),
            _getLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _getUsernameInput() {
    return _getInputTextField(
      TextInputType.number,
      controller: _usernameController,
      decoration: InputDecoration(
        hintText: "输入手机号",
        icon: Icon(
          Icons.mobile_friendly_rounded,
          size: 20,
        ),
        border: InputBorder.none,
        suffixIcon: GestureDetector(
          child: Offstage(
            child: Icon(Icons.clear),
            offstage: _username == '',
          ),
          onTap: () {
            setState(() {
              _username = '';
              _usernameController.clear();
            });
          },
        ),
      ),
      onChanged: (value) {
        // 使用onchanged() 完成双向绑定
        setState(() {
          _username = value;
        });
      },
    );
  }

  Widget _getPasswordInput() {
    return _getInputTextField(TextInputType.text,
        obscureText: true,
        controller: _passwordController,
        decoration: InputDecoration(
          hintText: "输入密码",
          icon: Icon(
            Icons.lock_open,
            size: 20.0,
          ),
          suffixIcon: GestureDetector(
            child: Offstage(
              child: Icon(Icons.clear),
              offstage: _password == '',
            ),
            onTap: () {
              setState(() {
                _password = '';
                _passwordController.clear();
              });
            },
          ),
          border: InputBorder.none,
        ), onChanged: (value) {
      setState(() {
        _password = value;
      });
    });
  }

  Widget _getRoundImage(String imageName, double size) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      // 抗锯齿
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size / 2))),
      child: Image.asset(
        imageName,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _getLoginButton() {
    return Container(
      height: 50,
      width: double.infinity,
      // 相当于Android 中 match_parent
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).primaryColor,
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),
        child: Text("登录"),
        onPressed: () {
          print(
              'Login: username=${_username.trim()}, password=${_password.trim()}');
        },
      ),
    );
  }

  Widget _getInputTextField(
    TextInputType keyboardType, {
    focusNode: FocusNode,
    controller: TextEditingController,
    onChanged: Function,
    decoration: InputDecoration,
    bool obscureText = false,
    height = 50.0,
  }) {
    return Container(
      height: height,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            keyboardType: keyboardType,
            focusNode: focusNode,
            obscureText: obscureText,
            controller: controller,
            decoration: decoration,
            onChanged: onChanged,
          ),
          Divider(
            height: 1.0,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
