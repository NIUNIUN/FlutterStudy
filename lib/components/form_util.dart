import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 用于存放通用的表单组件
 */
class FormUtil {
  static Widget textField(
    String formkey,
    String value,
    Color color, {
    TextInputType keyboardType = TextInputType.text,
    controller: TextEditingController,
    onChanged: Function,
    hintText: String,
    prefixIcon: IconData,
    onClear: Function,
    obscureText = false,
    height = 50.0,
    margin = 10.0,
  }) {
    return Container(
      height: height,
      margin: EdgeInsets.all(margin),
      child: Column(
        children: [
          TextField(
            keyboardType: keyboardType,
            cursorColor: color,

            //聚焦点，控制文本框是否获取焦点，从而实现类似上一个下一个的输入控制。
            // focusNode: focusNode,

            // obscureText ：是否需要隐藏输入的内容
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey[400],
              ),
              icon: Icon(
                prefixIcon,
                color: color,
                size: 20,
              ),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                // Offstage 作为后置组件，用于输入内容后可以点击清除。通过offstage属性来控制是否显示。
                child: Offstage(
                  child: Icon(
                    Icons.clear,
                    color: Colors.grey[400],
                  ),
                  offstage: value == null || '' == value,
                ),
                onTap: () {
                  onClear(formkey);
                },
              ),
            ),
            onChanged: (value) {
              // 使用onchanged() 完成双向绑定

              onChanged(formkey, value);
            },
          ),
          Divider(
            height: 1.0,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
