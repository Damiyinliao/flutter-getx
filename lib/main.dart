import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/pages/align_page.dart';
import 'package:flutter_woo_2025/pages/box_page.dart';
import 'package:flutter_woo_2025/pages/button_page.dart';
import 'package:flutter_woo_2025/pages/container_page.dart';
import 'package:flutter_woo_2025/pages/detail_page.dart';
import 'package:flutter_woo_2025/pages/flex_page.dart';
import 'package:flutter_woo_2025/pages/gesture_page.dart';
import 'package:flutter_woo_2025/pages/icons_page.dart';
import 'package:flutter_woo_2025/pages/image_page.dart';
import 'package:flutter_woo_2025/pages/input_page.dart';
import 'package:flutter_woo_2025/pages/mine_page.dart';
import 'package:flutter_woo_2025/pages/nav_page.dart';
import 'package:flutter_woo_2025/pages/row_column.dart';
import 'package:flutter_woo_2025/pages/splash_page.dart';
import 'package:flutter_woo_2025/pages/stack_page.dart';
import 'package:flutter_woo_2025/pages/theme_page.dart';
import 'package:flutter_woo_2025/pages/wrap_page.dart';
import 'package:flutter_woo_2025/service/http.dart';

void main() {
  HttpService().init();
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'NotoSansSC'
      ),
      // initialRoute: '/home',
      // routes: {
      //   '/home': (context) => NavPage(),
      //   '/detail': (context) => DetailPage()
      // },
      home: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}
class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: 4,
      vsync: this,
    );
    _controller.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    debugPrint('当前索引: ${_controller.index}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义控制器示例"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _controller,
          tabs: tabs(),
          indicatorColor: Colors.red,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.blueGrey,
        ),
      ),
      // bottomNavigationBar: ,
      body: TabBarView(
        controller: _controller,
        children: const [
          Center(child: Text('首页内容')),
          Center(child: Text('发现内容')),
          Center(child: Text('通知列表')),
          // Center(child: Text('个人中心')),
          MinePage()
        ],
      ),
    );
  }

  List<Widget> tabs() {
    return const [
      Tab(text: '首页'),
      Tab(text: '发现'),
      Tab(text: '通知'),
      Tab(text: '我的'),
    ];
  }
}
// class ScaffoldPage extends StatelessWidget {
//   const ScaffoldPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // 菜单栏
//       appBar: AppBar(
//         title: const Text('Material App Bar'),
//       ),
//       backgroundColor: Color(0xFFF5F5F5),
//       // 正文
//       body: MinePage()
//     );
//   }
// }

