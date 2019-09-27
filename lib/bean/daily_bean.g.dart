// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyBean _$DailyBeanFromJson(Map<String, dynamic> json) {
  return DailyBean(
      nextPageUrl: json['nextPageUrl'] as String,
      nextPublishTime: json['nextPublishTime'] as int,
      newestIssueType: json['newestIssueType'] as String,
      dialog: json['dialog'],
      issueList: (json['issueList'] as List)
          ?.map((e) => e == null
              ? null
              : IssueListBean.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DailyBeanToJson(DailyBean instance) => <String, dynamic>{
      'nextPageUrl': instance.nextPageUrl,
      'nextPublishTime': instance.nextPublishTime,
      'newestIssueType': instance.newestIssueType,
      'dialog': instance.dialog,
      'issueList': instance.issueList
    };

IssueListBean _$IssueListBeanFromJson(Map<String, dynamic> json) {
  return IssueListBean(
      releaseTime: json['releaseTime'] as int,
      type: json['type'] as String,
      date: json['date'] as int,
      publishTime: json['publishTime'] as int,
      count: json['count'] as int,
      itemList: (json['itemList'] as List)
          ?.map((e) => e == null
              ? null
              : ItemListBean.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$IssueListBeanToJson(IssueListBean instance) =>
    <String, dynamic>{
      'releaseTime': instance.releaseTime,
      'type': instance.type,
      'date': instance.date,
      'publishTime': instance.publishTime,
      'count': instance.count,
      'itemList': instance.itemList
    };

ItemListBean _$ItemListBeanFromJson(Map<String, dynamic> json) {
  return ItemListBean(
      type: json['type'] as String,
      data: json['data'] == null
          ? null
          : DataBean.fromJson(json['data'] as Map<String, dynamic>),
      tag: json['tag'],
      id: json['id'] as int,
      adIndex: json['adIndex'] as int);
}

Map<String, dynamic> _$ItemListBeanToJson(ItemListBean instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'tag': instance.tag,
      'id': instance.id,
      'adIndex': instance.adIndex
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
      dataType: json['dataType'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      library: json['library'] as String,
      consumption: json['consumption'] == null
          ? null
          : ConsumptionBean.fromJson(
              json['consumption'] as Map<String, dynamic>),
      resourceType: json['resourceType'] as String,
      slogan: json['slogan'] as String,
      provider: json['provider'] == null
          ? null
          : ProviderBean.fromJson(json['provider'] as Map<String, dynamic>),
      category: json['category'] as String,
      author: json['author'] == null
          ? null
          : AuthorBean.fromJson(json['author'] as Map<String, dynamic>),
      cover: json['cover'] == null
          ? null
          : CoverBean.fromJson(json['cover'] as Map<String, dynamic>),
      playUrl: json['playUrl'] as String,
      thumbPlayUrl: json['thumbPlayUrl'],
      duration: json['duration'] as int,
      webUrl: json['webUrl'] == null
          ? null
          : WebUrlBean.fromJson(json['webUrl'] as Map<String, dynamic>),
      releaseTime: json['releaseTime'] as int,
      campaign: json['campaign'],
      waterMarks: json['waterMarks'],
      ad: json['ad'] as bool,
      adTrack: json['adTrack'],
      type: json['type'] as String,
      titlePgc: json['titlePgc'],
      descriptionPgc: json['descriptionPgc'],
      remark: json['remark'],
      ifLimitVideo: json['ifLimitVideo'] as bool,
      searchWeight: json['searchWeight'] as int,
      idx: json['idx'] as int,
      shareAdTrack: json['shareAdTrack'],
      favoriteAdTrack: json['favoriteAdTrack'],
      webAdTrack: json['webAdTrack'],
      date: json['date'] as int,
      promotion: json['promotion'],
      label: json['label'],
      descriptionEditor: json['descriptionEditor'] as String,
      collected: json['collected'] as bool,
      played: json['played'] as bool,
      lastViewTime: json['lastViewTime'],
      playlists: json['playlists'],
      src: json['src'],
      tags: (json['tags'] as List)
          ?.map((e) =>
              e == null ? null : TagsBean.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      playInfo: (json['playInfo'] as List)
          ?.map((e) => e == null
              ? null
              : PlayInfoBean.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      labelList: json['labelList'] as List,
      subtitles: json['subtitles'] as List);
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'dataType': instance.dataType,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'library': instance.library,
      'consumption': instance.consumption,
      'resourceType': instance.resourceType,
      'slogan': instance.slogan,
      'provider': instance.provider,
      'category': instance.category,
      'author': instance.author,
      'cover': instance.cover,
      'playUrl': instance.playUrl,
      'thumbPlayUrl': instance.thumbPlayUrl,
      'duration': instance.duration,
      'webUrl': instance.webUrl,
      'releaseTime': instance.releaseTime,
      'campaign': instance.campaign,
      'waterMarks': instance.waterMarks,
      'ad': instance.ad,
      'adTrack': instance.adTrack,
      'type': instance.type,
      'titlePgc': instance.titlePgc,
      'descriptionPgc': instance.descriptionPgc,
      'remark': instance.remark,
      'ifLimitVideo': instance.ifLimitVideo,
      'searchWeight': instance.searchWeight,
      'idx': instance.idx,
      'shareAdTrack': instance.shareAdTrack,
      'favoriteAdTrack': instance.favoriteAdTrack,
      'webAdTrack': instance.webAdTrack,
      'date': instance.date,
      'promotion': instance.promotion,
      'label': instance.label,
      'descriptionEditor': instance.descriptionEditor,
      'collected': instance.collected,
      'played': instance.played,
      'lastViewTime': instance.lastViewTime,
      'playlists': instance.playlists,
      'src': instance.src,
      'tags': instance.tags,
      'playInfo': instance.playInfo,
      'labelList': instance.labelList,
      'subtitles': instance.subtitles
    };

WebUrlBean _$WebUrlBeanFromJson(Map<String, dynamic> json) {
  return WebUrlBean(
      raw: json['raw'] as String, forWeibo: json['forWeibo'] as String);
}

Map<String, dynamic> _$WebUrlBeanToJson(WebUrlBean instance) =>
    <String, dynamic>{'raw': instance.raw, 'forWeibo': instance.forWeibo};

ProviderBean _$ProviderBeanFromJson(Map<String, dynamic> json) {
  return ProviderBean(
      name: json['name'] as String,
      alias: json['alias'] as String,
      icon: json['icon'] as String);
}

Map<String, dynamic> _$ProviderBeanToJson(ProviderBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'alias': instance.alias,
      'icon': instance.icon
    };

AuthorBean _$AuthorBeanFromJson(Map<String, dynamic> json) {
  return AuthorBean(
      id: json['id'] as int,
      icon: json['icon'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
      latestReleaseTime: json['latestReleaseTime'] as int,
      videoNum: json['videoNum'] as int,
      adTrack: json['adTrack'],
      follow: json['follow'] == null
          ? null
          : FollowBean.fromJson(json['follow'] as Map<String, dynamic>),
      shield: json['shield'] == null
          ? null
          : ShieldBean.fromJson(json['shield'] as Map<String, dynamic>),
      approvedNotReadyVideoCount: json['approvedNotReadyVideoCount'] as int,
      ifPgc: json['ifPgc'] as bool,
      recSort: json['recSort'] as int,
      expert: json['expert'] as bool);
}

Map<String, dynamic> _$AuthorBeanToJson(AuthorBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'description': instance.description,
      'link': instance.link,
      'latestReleaseTime': instance.latestReleaseTime,
      'videoNum': instance.videoNum,
      'adTrack': instance.adTrack,
      'follow': instance.follow,
      'shield': instance.shield,
      'approvedNotReadyVideoCount': instance.approvedNotReadyVideoCount,
      'ifPgc': instance.ifPgc,
      'recSort': instance.recSort,
      'expert': instance.expert
    };

FollowBean _$FollowBeanFromJson(Map<String, dynamic> json) {
  return FollowBean(
      itemType: json['itemType'] as String,
      itemId: json['itemId'] as int,
      followed: json['followed'] as bool);
}

Map<String, dynamic> _$FollowBeanToJson(FollowBean instance) =>
    <String, dynamic>{
      'itemType': instance.itemType,
      'itemId': instance.itemId,
      'followed': instance.followed
    };

ShieldBean _$ShieldBeanFromJson(Map<String, dynamic> json) {
  return ShieldBean(
      itemType: json['itemType'] as String,
      itemId: json['itemId'] as int,
      shielded: json['shielded'] as bool);
}

Map<String, dynamic> _$ShieldBeanToJson(ShieldBean instance) =>
    <String, dynamic>{
      'itemType': instance.itemType,
      'itemId': instance.itemId,
      'shielded': instance.shielded
    };

CoverBean _$CoverBeanFromJson(Map<String, dynamic> json) {
  return CoverBean(
      feed: json['feed'] as String,
      detail: json['detail'] as String,
      blurred: json['blurred'] as String,
      sharing: json['sharing'],
      homepage: json['homepage'] as String);
}

Map<String, dynamic> _$CoverBeanToJson(CoverBean instance) => <String, dynamic>{
      'feed': instance.feed,
      'detail': instance.detail,
      'blurred': instance.blurred,
      'sharing': instance.sharing,
      'homepage': instance.homepage
    };

TagsBean _$TagsBeanFromJson(Map<String, dynamic> json) {
  return TagsBean(
      id: json['id'] as int,
      name: json['name'] as String,
      actionUrl: json['actionUrl'] as String,
      adTrack: json['adTrack'],
      desc: json['desc'],
      bgPicture: json['bgPicture'] as String,
      headerImage: json['headerImage'] as String,
      tagRecType: json['tagRecType'] as String,
      childTagList: json['childTagList'],
      childTagIdList: json['childTagIdList'],
      communityIndex: json['communityIndex'] as int);
}

Map<String, dynamic> _$TagsBeanToJson(TagsBean instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'actionUrl': instance.actionUrl,
      'adTrack': instance.adTrack,
      'desc': instance.desc,
      'bgPicture': instance.bgPicture,
      'headerImage': instance.headerImage,
      'tagRecType': instance.tagRecType,
      'childTagList': instance.childTagList,
      'childTagIdList': instance.childTagIdList,
      'communityIndex': instance.communityIndex
    };

PlayInfoBean _$PlayInfoBeanFromJson(Map<String, dynamic> json) {
  return PlayInfoBean(
      height: json['height'] as int,
      width: json['width'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
      urlList: (json['urlList'] as List)
          ?.map((e) => e == null
              ? null
              : UrlListBean.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PlayInfoBeanToJson(PlayInfoBean instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'name': instance.name,
      'type': instance.type,
      'url': instance.url,
      'urlList': instance.urlList
    };

ConsumptionBean _$ConsumptionBeanFromJson(Map<String, dynamic> json) {
  return ConsumptionBean(
      collectionCount: json['collectionCount'] as int,
      shareCount: json['shareCount'] as int,
      replyCount: json['replyCount'] as int);
}

Map<String, dynamic> _$ConsumptionBeanToJson(ConsumptionBean instance) =>
    <String, dynamic>{
      'collectionCount': instance.collectionCount,
      'shareCount': instance.shareCount,
      'replyCount': instance.replyCount
    };

UrlListBean _$UrlListBeanFromJson(Map<String, dynamic> json) {
  return UrlListBean(
      name: json['name'] as String,
      url: json['url'] as String,
      size: json['size'] as int);
}

Map<String, dynamic> _$UrlListBeanToJson(UrlListBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'size': instance.size
    };
