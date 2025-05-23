import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_woo_2025/assets.dart';
import 'package:flutter_woo_2025/tabbar_pages/culture_page.dart';
import 'package:flutter_woo_2025/tabbar_pages/home_page.dart';
import 'package:flutter_woo_2025/tabbar_pages/mine_page.dart';
import 'package:flutter_woo_2025/tabbar_pages/order_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {

  int pageIndex = 0;
  List pageList = [ HomePage(), CulturePage(), OrderPage(), MinePage() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('底部tabbar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 防止高度浮动
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsImages.islandMinSvg, width: 36, height: 36,),
            activeIcon: SvgPicture.asset(AssetsImages.islandSelectedMinSvg, width: 36, height: 36,),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsImages.cultureSvg, width: 20, height: 20),
            activeIcon: SvgPicture.asset(AssetsImages.cultureSelectedSvg, width: 20, height: 20),
            label: '文创'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsImages.orderSvg, width: 17, height: 20),
            activeIcon: SvgPicture.asset(AssetsImages.orderSelectedSvg, width: 17, height: 20),
            label: '订单'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsImages.mineSvg, width: 22, height: 19),
            activeIcon: SvgPicture.asset(AssetsImages.mineSelectedSvg, width: 22, height: 19),
            label: '我的'
          ),
        ],
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
      ),
      body: pageList[pageIndex],
    );
  }
}