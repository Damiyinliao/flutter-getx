import 'package:json_annotation/json_annotation.dart';

part 'goods_type.g.dart';

@JsonSerializable()
class GoodsType {
  final int artFlag;
  final int categoryId;
  final int id;
  final int maxPrice;
  final int minPrice;
  final String name;
  final List<String> picUrls;
  final int pointPrice;
  final int salesCount;
  final int virtualSalesCount;

  GoodsType({
    required this.artFlag,
    required this.categoryId,
    required this.id,
    required this.maxPrice,
    required this.minPrice,
    required this.name,
    required this.picUrls,
    required this.pointPrice,
    required this.salesCount,
    required this.virtualSalesCount
  });

  factory GoodsType.fromJson(Map<String, dynamic> json) => _$GoodsTypeFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsTypeToJson(this);
}
