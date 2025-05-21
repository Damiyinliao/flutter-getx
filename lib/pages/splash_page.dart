import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

    // 主视图
  Widget _buildView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 图标
        Container(
          color: Colors.white,
          width: 120,
          height: 120,
        ),
        // 标题
        const Text("Online Market"),
        // 倒计时
        const Text("10"),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0274bc),
      body: Center(
        child: _buildView(context),
      )
    );
  }
}