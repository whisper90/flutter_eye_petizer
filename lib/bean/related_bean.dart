import 'package:json_annotation/json_annotation.dart';
import 'daily_bean.dart';

part 'related_bean.g.dart';

///
/// 相关推荐对应的bean
///
@JsonSerializable()
class RelatedBean {

  List<ItemListBean> itemList;
  int count;
  int total;
  String nextPageUrl;
  bool adExist;

  RelatedBean({this.itemList, this.count, this.total,
    this.nextPageUrl, this.adExist});

  //反序列化
  factory RelatedBean.fromJson(Map<String, dynamic> json) => _$RelatedBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$RelatedBeanToJson(this);
}
