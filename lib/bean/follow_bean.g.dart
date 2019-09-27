// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowTabBean _$FollowTabBeanFromJson(Map<String, dynamic> json) {
  return FollowTabBean(
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

Map<String, dynamic> _$FollowTabBeanToJson(FollowTabBean instance) =>
    <String, dynamic>{
      'nextPageUrl': instance.nextPageUrl,
      'count': instance.count,
      'total': instance.total,
      'adExist': instance.adExist,
      'itemList': instance.itemList
    };

ItemListBean _$ItemListBeanFromJson(Map<String, dynamic> json) {
  return ItemListBean(
      type: json['type'] as String,
      data: json['data'] == null
          ? null
          : FollowDataBean.fromJson(json['data'] as Map<String, dynamic>),
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

FollowDataBean _$FollowDataBeanFromJson(Map<String, dynamic> json) {
  return FollowDataBean(
      dataType: json['dataType'] as String,
      header: json['header'] == null
          ? null
          : HeaderBean.fromJson(json['header'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : ContentBean.fromJson(json['content'] as Map<String, dynamic>),
      adTrack: json['adTrack']);
}

Map<String, dynamic> _$FollowDataBeanToJson(FollowDataBean instance) => <String, dynamic>{
      'dataType': instance.dataType,
      'header': instance.header,
      'content': instance.content,
      'adTrack': instance.adTrack
    };

HeaderBean _$HeaderBeanFromJson(Map<String, dynamic> json) {
  return HeaderBean(
      id: json['id'] as int,
      actionUrl: json['actionUrl'] as String,
      labelList: json['labelList'],
      icon: json['icon'] as String,
      iconType: json['iconType'] as String,
      time: json['time'] as int,
      showHateVideo: json['showHateVideo'] as bool,
      tagId: json['tagId'] as int,
      tagName: json['tagName'],
      issuerName: json['issuerName'] as String,
      topShow: json['topShow'] as bool);
}

Map<String, dynamic> _$HeaderBeanToJson(HeaderBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actionUrl': instance.actionUrl,
      'labelList': instance.labelList,
      'icon': instance.icon,
      'iconType': instance.iconType,
      'time': instance.time,
      'showHateVideo': instance.showHateVideo,
      'tagId': instance.tagId,
      'tagName': instance.tagName,
      'issuerName': instance.issuerName,
      'topShow': instance.topShow
    };

ContentBean _$ContentBeanFromJson(Map<String, dynamic> json) {
  return ContentBean(
      type: json['type'] as String,
      data: json['data'] == null
          ? null
          : DataBean.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ContentBeanToJson(ContentBean instance) =>
    <String, dynamic>{'type': instance.type, 'data': instance.data};

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

Map<String, dynamic> _$DataBeanToJson(DataBean instance) =>
    <String, dynamic>{
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
