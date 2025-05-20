import 'package:flutter/material.dart';

class BoxPage extends StatelessWidget {
  const BoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(10),
      
      // 装饰样式
      decoration: BoxDecoration(
        // 背景色
        color: Colors.amber,
        // 边框
        border: Border.all(
          color: Colors.red,
          width: 10,
        ),
      ),
      child: const Text('我是内容'),
    );
  }
}