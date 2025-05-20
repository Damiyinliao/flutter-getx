import 'package:flutter/material.dart';

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
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 菜单栏
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),

      // 悬浮按钮
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add_photo_alternate),
      // ),

      // 悬浮按钮位置
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // 固定在下方显示的按钮
      // persistentFooterButtons: const [
      //   Text('persistentFooterButtons1'),
      //   Text('persistentFooterButtons2'),
      // ],

      // 压缩顶部菜单空间
      // primary: true,

      // 左侧 侧滑抽屉菜单
      // drawer: const Drawer(
      //   child: Text('data'),
      // ),

      // 右侧 侧滑抽屉菜单
      // endDrawer: const Drawer(
      //   child: Text('data'),
      // ),

      // 检测手势行为方式，与drawer配合使用 down 方式有卡顿，可以 start 方式
      // drawerDragStartBehavior: DragStartBehavior.start,

      // 底部导航栏
      // bottomNavigationBar: const Text('bottomNavigationBar'),

      // 底部拉出菜单
      // bottomSheet: const Text('bottomSheet'),

      // 背景色
      // backgroundColor: Colors.amberAccent,

      // 自动适应底部padding
      // resizeToAvoidBottomInset: true,

      // 正文
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                // 脚手架管理
                // Scaffold.of(context).openDrawer();

                // 应用消息管理
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Hello!'),
                ));
              },
              child: const Text('showSnackBar'),
            ),
          );
        },
      ),
    );
  }
}

