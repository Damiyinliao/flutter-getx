import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/pages/detail_page.dart';
import 'package:flutter_woo_2025/pages/image_page.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const DetailPage(title: '一座岛');
                  })
                );
              },
              child: Text('Navigator.push点击跳转到详情页面')
            )
          ]
        )
      )
    );
  }
}