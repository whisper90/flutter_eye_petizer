import 'package:json_annotation/json_annotation.dart';

part 'daily_bean.g.dart';

///
/// 日报页对应的bean
///
@JsonSerializable()
class DailyBean {
  String nextPageUrl;
  int nextPublishTime;
  String newestIssueType;
  Object dialog;
  List<IssueListBean> issueList;

  DailyBean({this.nextPageUrl, this.nextPublishTime, this.newestIssueType,
      this.dialog, this.issueList});

  //反序列化
  factory DailyBean.fromJson(Map<String, dynamic> json) => _$DailyBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DailyBeanToJson(this);
}

@JsonSerializable()
class IssueListBean {
  int releaseTime;
  String type;
  int date;
  int publishTime;
  int count;
  List<ItemListBean> itemList;

  IssueListBean({this.releaseTime, this.type, this.date, this.publishTime,
      this.count, this.itemList});

  //反序列化
  factory IssueListBean.fromJson(Map<String, dynamic> json) => _$IssueListBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$IssueListBeanToJson(this);
}

@JsonSerializable()
class ItemListBean {
  String type;
  DataBean data;
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
class DataBean {
  String dataType;
  int id;
  String title;
  String description;
  String library;
  ConsumptionBean consumption;
  String resourceType;
  String slogan;
  ProviderBean provider;
  String category;
  AuthorBean author;
  CoverBean cover;
  String playUrl;
  Object thumbPlayUrl;
  int duration;
  WebUrlBean webUrl;
  int releaseTime;
  Object campaign;
  Object waterMarks;
  bool ad;
  Object adTrack;
  String type;
  Object titlePgc;
  Object descriptionPgc;
  Object remark;
  bool ifLimitVideo;
  int searchWeight;
  int idx;
  Object shareAdTrack;
  Object favoriteAdTrack;
  Object webAdTrack;
  int date;
  Object promotion;
  Object label;
  String descriptionEditor;
  bool collected;
  bool played;
  Object lastViewTime;
  Object playlists;
  Object src;
  List<TagsBean> tags;
  List<PlayInfoBean> playInfo;
  List<Object> labelList;
  List<Object> subtitles;

  DataBean({this.dataType, this.id, this.title, this.description, this.library,
      this.consumption, this.resourceType, this.slogan, this.provider,
      this.category, this.author, this.cover, this.playUrl, this.thumbPlayUrl,
      this.duration, this.webUrl, this.releaseTime, this.campaign,
      this.waterMarks, this.ad, this.adTrack, this.type, this.titlePgc,
      this.descriptionPgc, this.remark, this.ifLimitVideo, this.searchWeight,
      this.idx, this.shareAdTrack, this.favoriteAdTrack, this.webAdTrack,
      this.date, this.promotion, this.label, this.descriptionEditor,
      this.collected, this.played, this.lastViewTime, this.playlists, this.src,
      this.tags, this.playInfo, this.labelList, this.subtitles});

  //反序列化
  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class WebUrlBean {
  String raw;
  String forWeibo;

  WebUrlBean({this.raw, this.forWeibo});

  //反序列化
  factory WebUrlBean.fromJson(Map<String, dynamic> json) => _$WebUrlBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$WebUrlBeanToJson(this);
}

@JsonSerializable()
class ProviderBean {
  String name;
  String alias;
  String icon;

  ProviderBean({this.name, this.alias, this.icon});

  //反序列化
  factory ProviderBean.fromJson(Map<String, dynamic> json) => _$ProviderBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ProviderBeanToJson(this);
}

@JsonSerializable()
class AuthorBean {
  int id;
  String icon;
  String name;
  String description;
  String link;
  int latestReleaseTime;
  int videoNum;
  Object adTrack;
  FollowBean follow;
  ShieldBean shield;
  int approvedNotReadyVideoCount;
  bool ifPgc;
  int recSort;
  bool expert;

  AuthorBean({this.id, this.icon, this.name, this.description, this.link,
      this.latestReleaseTime, this.videoNum, this.adTrack, this.follow,
      this.shield, this.approvedNotReadyVideoCount, this.ifPgc, this.recSort,
      this.expert});

  //反序列化
  factory AuthorBean.fromJson(Map<String, dynamic> json) => _$AuthorBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$AuthorBeanToJson(this);
}

@JsonSerializable()
class FollowBean {
  String itemType;
  int itemId;
  bool followed;

  FollowBean({this.itemType, this.itemId, this.followed});

  //反序列化
  factory FollowBean.fromJson(Map<String, dynamic> json) => _$FollowBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$FollowBeanToJson(this);
}

@JsonSerializable()
class ShieldBean {
  String itemType;
  int itemId;
  bool shielded;

  ShieldBean({this.itemType, this.itemId, this.shielded});

  //反序列化
  factory ShieldBean.fromJson(Map<String, dynamic> json) => _$ShieldBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ShieldBeanToJson(this);
}

@JsonSerializable()
class CoverBean {
  String feed;
  String detail;
  String blurred;
  Object sharing;
  String homepage;

  CoverBean({this.feed, this.detail, this.blurred, this.sharing, this.homepage});

  //反序列化
  factory CoverBean.fromJson(Map<String, dynamic> json) => _$CoverBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$CoverBeanToJson(this);
}

@JsonSerializable()
class TagsBean {
  int id;
  String name;
  String actionUrl;
  Object adTrack;
  Object desc;
  String bgPicture;
  String headerImage;
  String tagRecType;
  Object childTagList;
  Object childTagIdList;
  int communityIndex;

  TagsBean({this.id, this.name, this.actionUrl, this.adTrack, this.desc,
      this.bgPicture, this.headerImage, this.tagRecType, this.childTagList,
      this.childTagIdList, this.communityIndex});

  //反序列化
  factory TagsBean.fromJson(Map<String, dynamic> json) => _$TagsBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$TagsBeanToJson(this);
}

@JsonSerializable()
class PlayInfoBean {
  int height;
  int width;
  String name;
  String type;
  String url;
  List<UrlListBean> urlList;

  PlayInfoBean({this.height, this.width, this.name, this.type, this.url,
      this.urlList});

  //反序列化
  factory PlayInfoBean.fromJson(Map<String, dynamic> json) => _$PlayInfoBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$PlayInfoBeanToJson(this);
}

@JsonSerializable()
class ConsumptionBean {
  int collectionCount;
  int shareCount;
  int replyCount;

  ConsumptionBean({this.collectionCount, this.shareCount, this.replyCount});

  //反序列化
  factory ConsumptionBean.fromJson(Map<String, dynamic> json) => _$ConsumptionBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ConsumptionBeanToJson(this);
}

@JsonSerializable()
class UrlListBean {
  String name;
  String url;
  int size;

  UrlListBean({this.name, this.url, this.size});

  //反序列化
  factory UrlListBean.fromJson(Map<String, dynamic> json) => _$UrlListBeanFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$UrlListBeanToJson(this);
}

