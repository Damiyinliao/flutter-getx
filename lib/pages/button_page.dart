import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/service/http.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: (){},
            child: const Text('一座岛'),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
              // foregroundColor: WidgetStateProperty.all(Colors.lightBlue),
            )
          ),
          TextButton(onPressed: (){
            HttpService().get('/app-api/product/spu/page?pageNo=1&pageSize=10&status=1').then((res) => {
              print(res)
            });
          }, child: Text('哈哈哈哈'))
        ]
      )
    );
  }
}