import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';

part 'billboard_bean.g.dart';

///
/// 榜单页对应的bean
///
@JsonSerializable()
class BillboardBean {
  List<ItemListBean> itemList;
  int count;
  int total;
  String nextPageUrl;
  bool adExist;

  BillboardBean({this.itemList, this.count, this.total,
    this.nextPageUrl, this.adExist});

  //反序列化
  factory BillboardBean.fromJson(Map<String, dynamic> json) => _$BillboardBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$BillboardBeanToJson(this);
}