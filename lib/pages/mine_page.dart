import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_woo_2025/assets.dart';
import 'package:flutter_woo_2025/common/components/ocean_page.dart';

class OperationItem {
  final String icon;
  final String name;
  const OperationItem({required this.icon, required this.name});
}

const List<OperationItem> operationList = [
  OperationItem(icon: AssetsImages.wallet2Svg, name: '卡包'),
  OperationItem(icon: AssetsImages.locationSvg, name: '地址'),
  OperationItem(icon: AssetsImages.settingSvg, name: '隐私政策'),
  OperationItem(icon: AssetsImages.serviceSvg, name: '在线客服'),
  OperationItem(icon: AssetsImages.xSvg, name: '登出'),
];

class MinePage extends StatelessWidget {
  const MinePage({super.key});


  Widget _buildMineHeader(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          // borderRadius: BorderRadiusGeometry.circular(50),
          child: Image.network(
            'https://api.93land.com/cloudapi/admin-api/infra/file/11/get/0c360d2ba547c560f4d0849f8154926a80c420c586a86d2ba98b36cd81daf9b6.jpeg',
            height: 67,
            width: 67,
            fit: BoxFit.cover,
          )
        ),
        SizedBox(
          height: 67,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('何伟', style: TextStyle(fontSize: 22)),
                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: SvgPicture.asset(
                        AssetsImages.vipSvg,
                        width: 15,
                        height: 15,
                      ),
                    )
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      print('查看家属');
                    },
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 9),
                      decoration: BoxDecoration(
                        color: Color(0xFF044da5),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Text(
                        '查看家属信息',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ),
                )
              ],
            ),
          )
        ),
      ]
    );
  }

  Widget _buildCompayCard(BuildContext context) {
    return SizedBox(
      height: 86,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: ClipRect(
              child: Transform.translate(
                offset: Offset(0, 0),
                child: Image.asset(
                  AssetsImages.companyInfoBgPng,
                  height: 86,
                  fit: BoxFit.none
                )
              )
            )
          ),
          Positioned(
            right: 16,
            top: 30,
            child: Image.network(
              'https://api.93land.com/cloudapi/admin-api/infra/file/11/get/3829a6b07cf165c7d817a21a1eb584a712e057d2dca9345ce56a921c7e9db35a.jpeg',
              width: 30,
              height: 30,
            )
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 2,
                  children: [
                    Image.asset(AssetsImages.langhuaPng, width: 15, height: 15),
                    Text('4233', style: TextStyle(color: Color(0xFFFF5201), fontSize: 18, fontWeight: FontWeight.w700),)
                  ],
                ),
                Text('浙江蔚海还有科技有限公司', style: TextStyle(fontSize: 14))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOperationCard(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 18),        
        child: GridView.count(
          crossAxisCount: 4, // 一行显示4个
          crossAxisSpacing: 10, // 横向间距
          mainAxisSpacing: 10, // 纵向间距
          shrinkWrap: true, // 防止无限高度（嵌套时用）
          physics: NeverScrollableScrollPhysics(), // 禁用滚动（可选）
          children: operationList.map((item) {
            return InkWell(
              onTap: () {
                print('你点击了${item.name}');
              },
              child: Column(
                spacing: 14,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(item.icon, width: 30, height: 30, fit: BoxFit.fitWidth),
                  Text(item.name, style: TextStyle(fontSize: 14))
                ]
              )
            );
          }).toList()
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return OceanPage(
      child: Column(
        children: [
          SizedBox(height: 100),
          _buildMineHeader(context),
          SizedBox(height: 29),
          _buildCompayCard(context),
          SizedBox(height: 10),
          _buildOperationCard(context)
        ]
      )
    );
  }
}