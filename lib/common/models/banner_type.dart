import 'package:json_annotation/json_annotation.dart';

part 'banner_type.g.dart';

@JsonSerializable()
class BannerType {
  final int id;
  final int createTime;
  final String? memo;
  final String picUrl;
  final int position;
  final int sort;
  final int status;
  final String title;
  final String? url;

  BannerType({
    required this.id,
    required this.createTime,
    required this.memo,
    required this.picUrl,
    required this.position,
    required this.sort,
    required this.status,
    required this.title,
    required this.url,
  });

  factory BannerType.fromJson(Map<String, dynamic> json) => _$BannerTypeFromJson(json);
  Map<String, dynamic> toJson() => _$BannerTypeToJson(this);
}


// flutter pub run build_runner build
