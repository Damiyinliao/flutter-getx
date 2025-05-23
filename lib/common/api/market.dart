
import 'package:flutter_woo_2025/common/index.dart';
import 'package:flutter_woo_2025/common/models/banner_type.dart';


Future<List<BannerType>> bannerList() async {
  final res = await HttpService().get<List<BannerType>>(
    '/app-api/promotion/market/banner/list',
    fromJsonT: (json) => (json as List)
        .map((e) => BannerType.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
  if (!res.success) throw Exception('请求失败：${res.msg}');
  return res.data;
}