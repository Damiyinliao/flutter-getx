import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  double? dx, dy;

  Widget _buildView() {
    return GestureDetector(
      child: Container(
        color: Colors.amber,
        width: 200,
        height: 200,
      ),
      // 点击
      onTap: () {
        print('点击 onTap');
      },
      // 长按
      onLongPress: () {
        print('长按 onLongPress');
      },
      // 双击
      onDoubleTap: () {
        print('双击 onLongPress');
      },

      // 按下
      onPanDown: (DragDownDetails e) {
        print("按下 ${e.globalPosition}");
      },
      // 按下滑动
      onPanUpdate: (DragUpdateDetails e) {
        setState(() {
          dx = e.delta.dx;
          dy = e.delta.dy;
        });
      },
      // 松开
      onPanEnd: (DragEndDetails e) {
        print(e.velocity);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildView(),

            // 显示
            Text('x: $dx, y: $dy'),
          ],
        ),
      ),
    );
  }
}