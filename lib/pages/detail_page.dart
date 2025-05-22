import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/pages/image_page.dart';

class DetailPage extends StatelessWidget {
   // 参数
  final String? title;
  const DetailPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {

    // final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // var title = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页：$title'),
      ),
      body:  Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Navigator.pop返回到导航页')
            )
          ]
        )
      )
    );
  }
}