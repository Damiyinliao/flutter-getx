import 'package:flutter/material.dart';

/// wrap布局弥补flex布局不能换行的缺点
class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 100,
      alignment: WrapAlignment.start,
      children: const [
        FlutterLogo(size: 100),
        FlutterLogo(size: 100),
        FlutterLogo(size: 100),
        FlutterLogo(size: 100),
        FlutterLogo(size: 100),
        FlutterLogo(size: 100),
      ],
    );
  }
}