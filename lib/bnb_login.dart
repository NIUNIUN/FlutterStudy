import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttermyapp/components/form_util.dart';

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
        title: const Text('登录'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // _getRoundImage("images/lake.jpg", 100.0),
            _getRoundImage(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                100.0),
            SizedBox(height: 60),
            SizedBox(height: 10),
            _getUsernameInput2(),
            _getPasswordInput2(),
            _getLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _getUsernameInput2() {
    return FormUtil.textField(
      'username',
      (_formData['username']?['value']).toString(),
      Theme.of(context).primaryColor,
      keyboardType: TextInputType.number,
      controller: _formData['username']?['controller'],
      hintText: '请输入手机号',
      prefixIcon: Icons.mobile_friendly,
      onChanged: _handleTextFieldChanged,
      onClear: _handleClear,
    );
  }

  Widget _getPasswordInput2() {
    return FormUtil.textField(
      'password',
      (_formData['password']?['value']).toString(),
      Theme.of(context).primaryColor,
      keyboardType: TextInputType.number,
      controller: _formData['password']?['controller'],
      hintText: '请输入密码',
      prefixIcon: Icons.mobile_friendly,
      onChanged: _handleTextFieldChanged,
      onClear: _handleClear,
    );
  }

  Widget _getRoundImage(String imageName, double size) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      // 抗锯齿

      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size / 2))),
      child:
          // Image.asset(
          CachedNetworkImage(
        // Image.network(
        imageUrl: imageName,
        fit: BoxFit.fill,
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

  Map<String, Map<String, Object>> _formData = {
    'username': {
      'value': '',
      'controller': TextEditingController(),
      'obsecure': false,
    },
    'password': {
      'value': '',
      'controller': TextEditingController(),
      'obsecure': true,
    }
  };

  _handleTextFieldChanged(String formKay, String value) {
    this.setState(() {
      _formData[formKay]?['value'] = value;
    });
  }

  _handleClear(String formKey) {
    this.setState(() {
      _formData[formKey]?['value'] = '';
      (_formData[formKey]?['controller'] as TextEditingController).clear();
    });
  }
}
