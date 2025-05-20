import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/pages/align_page.dart';
import 'package:flutter_woo_2025/pages/box_page.dart';
import 'package:flutter_woo_2025/pages/container_page.dart';
import 'package:flutter_woo_2025/pages/flex_page.dart';
import 'package:flutter_woo_2025/pages/row_column.dart';
import 'package:flutter_woo_2025/pages/stack_page.dart';
import 'package:flutter_woo_2025/pages/wrap_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScaffoldPage(),
    );
  }
}
class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 菜单栏
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),

      // 正文
      body: AlignPage()
    );
  }
}

