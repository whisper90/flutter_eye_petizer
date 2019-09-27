import 'dart:async';
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import 'package:flutter_eye_petizer/bean/related_bean.dart';
import 'package:flutter_eye_petizer/constant/url_constant.dart';
import 'package:quiver/strings.dart';

import 'bloc_provider.dart';

class PlayPageBloc extends BlocBase {

  StreamController<List<DataBean>> _controller = StreamController.broadcast();
  Sink<List<DataBean>> get _playPageSink => _controller.sink;
  List<DataBean> _playPageList;
  Stream<List<DataBean>> get playPageStream => _controller.stream;

  @override
  void dispose() {
    debugPrint('--->>>playpagebloc dispose');
    _controller?.close();
  }

  @override
  bool enablePullUp() {
    return true;
  }

  Future getData(int id) {
    String url = UrlConstant.baseUrl + UrlConstant.relatedUrl + id.toString();
    return fetchRelatedData(url).then((bean) {
      buildDailyPageList(bean);
    });
  }

  Future<RelatedBean> fetchRelatedData(String url) async {
    try {
      if (isEmpty(url)) {
        return null;
      }
      debugPrint('---->>>related page url:' + url);
      var dio = new Dio()
        ..interceptors.add(LogInterceptor());
      Response response = await dio.get(
          url,
          options: Options(
              headers: {
                "User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36",
              })
      );
      var bean = RelatedBean.fromJson(response.data);
      return bean;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  void buildDailyPageList(RelatedBean data) {
    if (data == null || data?.itemList == null || data.itemList.isEmpty) {
      return;
    }
    if (_playPageList == null || _playPageList.length == 0) {
      _playPageList = new List();
    }
    for (ItemListBean item in data?.itemList) {
      if (item != null && item.type != null && item.type == 'videoSmallCard') {
        _playPageList.add(item?.data);
      }
    }
    if (_playPageList != null && _playPageList.length > 0) {
      _playPageSink.add(UnmodifiableListView<DataBean>(
          _playPageList.sublist(0, _playPageList.length <= 9 ? _playPageList.length : 9)));
    }
  }
}