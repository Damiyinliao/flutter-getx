import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/assets.dart';

class OceanPage extends StatelessWidget {
  const OceanPage({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding; // 内容内边距，可选

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFBF3),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                AssetsImages.oceanPageBg,
                fit: BoxFit.cover,
              )
            )
          ),
          // 内容区域
          SafeArea(
            child: SingleChildScrollView(
              padding: padding ?? const EdgeInsets.all(16),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}