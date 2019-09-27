import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/follow_bean.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart' hide ItemListBean;
import 'package:flutter_eye_petizer/constant/url_constant.dart';
import 'package:flutter_eye_petizer/widget/multi_status_layout.dart';
import 'bloc_provider.dart';
import 'package:dio/dio.dart';
import 'package:quiver/strings.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FollowPageBloc extends BlocBase {

  StreamController<List<FollowDataBean>> _controller = StreamController.broadcast();
  Sink<List<FollowDataBean>> get _followPageSink => _controller.sink;
  List<FollowDataBean> _followPageList;
  Stream<List<FollowDataBean>> get followPageSteam => _controller.stream;

  StreamController<RefreshStatus> _event = StreamController.broadcast();
  Sink<RefreshStatus> get _eventSink => _event.sink;
  Stream<RefreshStatus> get eventStream => _event.stream;

  @override
  void dispose() {
    debugPrint('--->>>followpagebloc dispose');
    _controller?.close();
    _event?.close();
  }

  @override
  bool enablePullUp() {
    return isEmpty(_nextPageUrl) ? false : true;
  }

  Future getData(bool isReload) {
    String url = UrlConstant.baseUrl + UrlConstant.followUrl;
    if (isReload) {
      _followPageList?.clear();
    }
    return fetchFollowData(url).then((bean) {
      buildFollowPageList(bean);
    });
  }

  Future onLoadMore() {
    return fetchFollowData(_nextPageUrl).then((bean) {
      buildFollowPageList(bean);
      _eventSink.add(RefreshStatus.completed);
    });
  }

  Future onRefresh(bool isReload) {
    return getData(isReload);
  }

  Future<FollowTabBean> fetchFollowData(String url) async {
    try {
      if (isEmpty(url)) {
        return null;
      }
      debugPrint('---->>>follow page url:' + url);
      var dio = new Dio()
        ..interceptors.add(LogInterceptor());
      Response response = await dio.get(
          url,
          options: Options(
              headers: {
                "User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36",
              })
      );
      var bean = FollowTabBean.fromJson(response.data);
      return bean;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  var _nextPageUrl;
  void buildFollowPageList(FollowTabBean data) {
    if (data?.itemList == null || data.itemList.isEmpty) {
      return;
    }

    if (_followPageList == null || _followPageList.length == 0) {
      _followPageList = new List();
    }

    for (ItemListBean item in data?.itemList) {
      if (item?.type?.compareTo('autoPlayFollowCard') == 0) {
        _followPageList.add(item?.data);
      }
    }

    if (_followPageList != null && _followPageList.length > 0) {
      _followPageSink.add(UnmodifiableListView<FollowDataBean>(_followPageList));
    }

    _nextPageUrl = data?.nextPageUrl;
  }

  int getLoadStatus(AsyncSnapshot<List<FollowDataBean>> snapshot) {
    var status = -2;
    switch(snapshot.connectionState) {
      case ConnectionState.none:
        debugPrint('---->>>state.none');
        status = MultiStatusLayout.loading;
        break;
      case ConnectionState.waiting:
        debugPrint('---->>>state.waiting');
        status = MultiStatusLayout.loading;
        break;
      case ConnectionState.active:
        debugPrint('---->>>state.active');
        if (snapshot.hasError) {
          debugPrint('---->>>state.active.hasError:' + snapshot.error);
          status = MultiStatusLayout.error;
        }
        if (snapshot.data == null) {
          status = MultiStatusLayout.error;
        } else if (snapshot.data.length <= 0) {
          status = MultiStatusLayout.empty;
        } else {
          status =  MultiStatusLayout.success;
        }
        break;
      case ConnectionState.done:
        debugPrint('---->>>state.done');
        break;
      default:
        break;
    }
    debugPrint('--->>>status is $status');
    return status;
  }
}