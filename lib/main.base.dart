import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
const image1 = 'https://api.93land.com/cloudapi/admin-api/infra/file/11/get/c7d41bd908839b44ea56392f0610c5a421235738702979b1352d4f8f021c43f4.jpg';
const image2 = 'https://api.93land.com/cloudapi/admin-api/infra/file/11/get/7385e11be2f62fe8745ad75e538cb8c664d4e33e5259c903fbbf4ef8968d7e1e.jpg';
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('有状态无状态'),
        ),
        body: const BannerWidget2(),
      ),
    );
  }
}
// 无状态组件
class BannerWidget1 extends StatelessWidget {
  const BannerWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(image1);
  }
}
// 有状态的组件
class BannerWidget2 extends StatefulWidget {
  const BannerWidget2({super.key});

  @override
  State<BannerWidget2> createState() => _BannerWidget2State();
}

class _BannerWidget2State extends State<BannerWidget2> {

  String imageUrl = image1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.network(imageUrl),
        ImageWidget(imgUrl: imageUrl),
        ElevatedButton(
          onPressed: () {
            setState(() {
              imageUrl = imageUrl == image1 ? image2 : image1;
            });
          },
          child: const Text('切换按钮')
        )
      ]
    );
  }
}


class ImageWidget extends StatelessWidget {
  final String imgUrl;

  const ImageWidget({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(imgUrl);
  }
}