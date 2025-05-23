import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_woo_2025/assets.dart';
import 'package:flutter_woo_2025/common/api/market.dart';
import 'package:flutter_woo_2025/common/components/index.dart';
import 'package:flutter_woo_2025/common/config/index.dart';
import 'package:flutter_woo_2025/common/models/banner_type.dart';

class IndicatorDot extends StatelessWidget {
  final int count;         // 总页数
  final int activeIndex;   // 当前激活页索引
  final double itemWidth;  // 每个指示器宽度
  final double gap;        // 间距
  final double itemHeight;

  const IndicatorDot({
    super.key,
    required this.count,
    required this.activeIndex,
    this.itemWidth = 50,
    this.gap = 8,
    this.itemHeight = 4
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // 背景灰色条
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(count, (index) {
              return Container(
                width: itemWidth,
                height: itemHeight,
                margin: EdgeInsets.only(right: index < count - 1 ? gap : 0),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9E9E9),
                  borderRadius: BorderRadius.circular(16),
                ),
              );
            }),
          ),

          // 蓝色滑块
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: activeIndex * (itemWidth + gap),
            child: Container(
              width: itemWidth,
              height: itemHeight,
              decoration: BoxDecoration(
                color: const Color(0xFF166DD8),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendTab extends StatelessWidget {

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const RecommendTab({super.key, required this.title, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? Color(0xFF7197C4) : Colors.transparent,
              width: 4
            ),
          )
        ),
        child: Text(title, style: TextStyle(color: isActive ? Color(0xFF7197C4) : Colors.black, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<BannerType> headerBannerList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fecthBannerList();
  }

  void _fecthBannerList() async {
    try {
      final data = await bannerList();
      print('第一个标题:${data.first.title}');
      setState(() {
        headerBannerList = data;
      });
    } catch (e) {
      print('请求失败：$e');
    }
  }

  Widget buildHeaderBanner(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Swiper(
        itemCount: headerBannerList.length,
        itemBuilder: (context, index) {
          final banner = headerBannerList[index];
          return ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0.66, 1.0], // 从 66% 开始褪色到底部
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              banner.picUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
          );
        },
        // autoplay: true,
        pagination: const SwiperPagination(),
      )
    );
  }

  Widget _buildFirstOperationBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          spacing: 5,
          children: [
            Image.asset(AssetsImages.siginPng, width: 35, height: 35),
            Text('签到', style: TextStyle(fontSize: 12))
          ],
        ),
        Column(
          spacing: 5,
          children: [
            SvgPicture.asset(AssetsImages.mall2Svg, width: 35, height: 35),
            Text('商城', style: TextStyle(fontSize: 12))
          ],
        ),
        Column(
          spacing: 5,
          children: [
            SvgPicture.asset(AssetsImages.welfareSvg, width: 35, height: 35),
            Text('福利', style: TextStyle(fontSize: 12))
          ],
        ),
        Column(
          spacing: 5,
          children: [
            Image.asset(AssetsImages.workbenchPng, width: 35, height: 35),
            Text('工作台', style: TextStyle(fontSize: 12))
          ],
        ),
        Column(
          spacing: 5,
          children: [
            SvgPicture.asset(AssetsImages.coffeeSvg, width: 35, height: 35),
            Text('点单', style: TextStyle(fontSize: 12))
          ],
        ),
      ]
    );
  }
  Widget _buildSecondOperationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            spacing: 5,
            children: [
              Image.asset(AssetsImages.siginPng, width: 35, height: 35),
              Text('签到', style: TextStyle(fontSize: 12))
            ],
          ),
        ]
      ),
    );
  }

  Widget _buildOperationSwiper(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 5),
      child: SizedBox(
        height: 90,
        child: Swiper(
          itemCount: 2,
          loop: false,
          itemBuilder: (context, index) {
            if (index == 1) {
              return _buildSecondOperationBar(context);
            }
            return _buildFirstOperationBar(context);
          },
          pagination: SwiperPagination(
            builder: SwiperCustomPagination(
              builder: (context, config) {
                return IndicatorDot(activeIndex: config.activeIndex, count: 2, itemWidth: 25, itemHeight: 2);
              }
            )
          ),
        ),
      ),
    );
  }

  Widget _buildStorePoster(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Image.asset(
        AssetsImages.storePosterJpg,
        fit: BoxFit.fitWidth,
        width: double.infinity,
      )
    );
  }

  Widget _buildRecommendProduct(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text('精品推荐', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Row(
            children: [
              // RecommendTab(isActive: , title: '一座岛', onTap: () {  },),
              // RecommendTab(isActive: , title: '积分商城', onTap: () {  },)
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OceanPage(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          if (headerBannerList.isNotEmpty) buildHeaderBanner(context),
          _buildOperationSwiper(context),
          _buildStorePoster(context)
        ],
      )
    );
  }
}