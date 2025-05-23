import 'package:flutter/material.dart';

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
          Center(child: Text('个人中心')),
          // MinePage()
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