import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // 文本消息
  String _message = "";

  // 输入框控制器
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // 管理焦点
  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusScopeNode? focusScopeNode;

  // 输入框 - 用户名
  Widget _buildName() {
    return TextField(
      // 控制器
      controller: _controllerName,
      // 焦点
      autofocus: true,
      // 焦点管理
      focusNode: focusNodeName,
      // 输入框的样式
      decoration: const InputDecoration(
        labelText: '用户名',
        hintText: '请输入',
        prefixIcon: Icon(Icons.person),
        suffixIcon: Icon(Icons.edit),
        border: OutlineInputBorder(),
      ),
      // 输入改变事件
      onChanged: (String value) {
        setState(() {
          _message = value;
        });
      },
      // 提交回车事件
      onSubmitted: (String value) {
        focusScopeNode ??= FocusScope.of(context);
        focusScopeNode?.requestFocus(focusNodePassword);
      },
    );
  }

  // 输入框 - 密码
  Widget _buildPassword() {
    return TextField(
      controller: _controllerPassword,
      // 密码显示
      obscureText: true,
      // 焦点管理
      focusNode: focusNodePassword,
      // 输入框的样式
      decoration: const InputDecoration(
        labelText: '密码',
        hintText: '请输入',
        prefixIcon: Icon(Icons.person),
        suffixIcon: Icon(Icons.edit),
        border: OutlineInputBorder(),
      ),
    );
  }

  // 按钮
  Widget _buildButton() {
    return ElevatedButton(
      child: const Text('登录 Now!'),
      onPressed: () {
        setState(() {
          _message =
              'name:${_controllerName.text}, pass:${_controllerPassword.text}';
        });
      },
    );
  }

  // 显示
  Widget _buildMessage() {
    return Text(_message);
  }

  @override
  void dispose() {
    // 释放控制器
    _controllerName.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildName(),
            const SizedBox(height: 10),
            _buildPassword(),
            const SizedBox(height: 10),
            _buildButton(),
            const SizedBox(height: 10),
            _buildMessage(),
          ],
        ),
      ),
    );
  }
}

