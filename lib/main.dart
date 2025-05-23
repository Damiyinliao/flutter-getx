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
import 'package:flutter_woo_2025/tabbar_pages/bottombar_page.dart';
import 'package:flutter_woo_2025/tabbar_pages/mine_page.dart';
import 'package:flutter_woo_2025/pages/nav_page.dart';
import 'package:flutter_woo_2025/pages/row_column.dart';
import 'package:flutter_woo_2025/pages/splash_page.dart';
import 'package:flutter_woo_2025/pages/stack_page.dart';
import 'package:flutter_woo_2025/pages/tabbar_page.dart';
import 'package:flutter_woo_2025/pages/theme_page.dart';
import 'package:flutter_woo_2025/pages/wrap_page.dart';
import 'package:flutter_woo_2025/common/services/http.dart';

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
      home: BottomNavigationBarPage(),
    );
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

