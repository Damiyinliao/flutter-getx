// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerType _$BannerTypeFromJson(Map<String, dynamic> json) => BannerType(
      id: (json['id'] as num).toInt(),
      createTime: (json['createTime'] as num).toInt(),
      memo: json['memo'] as String?,
      picUrl: json['picUrl'] as String,
      position: (json['position'] as num).toInt(),
      sort: (json['sort'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      title: json['title'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$BannerTypeToJson(BannerType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'memo': instance.memo,
      'picUrl': instance.picUrl,
      'position': instance.position,
      'sort': instance.sort,
      'status': instance.status,
      'title': instance.title,
      'url': instance.url,
    };
