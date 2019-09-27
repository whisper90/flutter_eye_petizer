// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedBean _$RelatedBeanFromJson(Map<String, dynamic> json) {
  return RelatedBean(
      itemList: (json['itemList'] as List)
          ?.map((e) => e == null
              ? null
              : ItemListBean.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      count: json['count'] as int,
      total: json['total'] as int,
      nextPageUrl: json['nextPageUrl'] as String,
      adExist: json['adExist'] as bool);
}

Map<String, dynamic> _$RelatedBeanToJson(RelatedBean instance) =>
    <String, dynamic>{
      'itemList': instance.itemList,
      'count': instance.count,
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
      'adExist': instance.adExist
    };
