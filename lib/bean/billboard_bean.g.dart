// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billboard_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillboardBean _$BillboardBeanFromJson(Map<String, dynamic> json) {
  return BillboardBean(
      nextPageUrl: json['nextPageUrl'] as String,
      count: json['count'] as int,
      total: json['total'] as int,
      adExist: json['adExist'] as bool,
      itemList: (json['itemList'] as List)
          ?.map((e) => e == null
          ? null
          : ItemListBean.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BillboardBeanToJson(BillboardBean instance) => <String, dynamic>{
  'nextPageUrl': instance.nextPageUrl,
  'count': instance.count,
  'total': instance.total,
  'adExist': instance.adExist,
  'itemList': instance.itemList
};