import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';

part 'follow_bean.g.dart';

///
/// 关注页对应的bean
///
@JsonSerializable()
class FollowTabBean {
  String nextPageUrl;
  int count;
  int total;
  bool adExist;
  List<ItemListBean> itemList;

  FollowTabBean({this.nextPageUrl, this.count, this.total,
    this.adExist, this.itemList});

  //反序列化
  factory FollowTabBean.fromJson(Map<String, dynamic> json) => _$FollowTabBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$FollowTabBeanToJson(this);
}

@JsonSerializable()
class ItemListBean {
  String type;
  FollowDataBean data;
  Object tag;
  int id;
  int adIndex;

  ItemListBean({this.type, this.data, this.tag, this.id, this.adIndex});

  //反序列化
  factory ItemListBean.fromJson(Map<String, dynamic> json) => _$ItemListBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ItemListBeanToJson(this);
}

@JsonSerializable()
class FollowDataBean {
  String dataType;
  HeaderBean header;
  ContentBean content;
  Object adTrack;

  FollowDataBean({this.dataType, this.header, this.content, this.adTrack});

  //反序列化
  factory FollowDataBean.fromJson(Map<String, dynamic> json) => _$FollowDataBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$FollowDataBeanToJson(this);
}

@JsonSerializable()
class HeaderBean {
  int id;
  String actionUrl;
  Object labelList;
  String icon;
  String iconType;
  int time;
  bool showHateVideo;
  int tagId;
  Object tagName;
  String issuerName;
  bool topShow;

  HeaderBean({this.id, this.actionUrl, this.labelList, this.icon,
      this.iconType, this.time, this.showHateVideo, this.tagId, this.tagName,
      this.issuerName, this.topShow});

  //反序列化
  factory HeaderBean.fromJson(Map<String, dynamic> json) => _$HeaderBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$HeaderBeanToJson(this);
}

@JsonSerializable()
class ContentBean {
  String type;
  DataBean data;


  ContentBean({this.type, this.data}); //反序列化
  factory ContentBean.fromJson(Map<String, dynamic> json) => _$ContentBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ContentBeanToJson(this);
}

