import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import 'package:flutter_eye_petizer/constant/url_constant.dart';
import 'package:flutter_eye_petizer/widget/multi_status_layout.dart';
import 'bloc_provider.dart';
import 'package:dio/dio.dart';
import 'package:quiver/strings.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DailyPageBloc extends BlocBase {

  StreamController<List<DataBean>> _controller = StreamController.broadcast();
  Sink<List<DataBean>> get _dailyPageSink => _controller.sink;
  List<DataBean> _dailyPageList;
  Stream<List<DataBean>> get dailyPageSteam => _controller.stream;

  StreamController<RefreshStatus> _event = StreamController.broadcast();
  Sink<RefreshStatus> get _eventSink => _event.sink;
  Stream<RefreshStatus> get eventStream => _event.stream;

  @override
  void dispose() {
    debugPrint('--->>>dailypagebloc dispose');
    _controller?.close();
    _event?.close();
  }

  @override
  bool enablePullUp() {
    return isEmpty(_nextPageUrl) ? false : true;
  }

  Future getData(bool isReload) {
    String url = UrlConstant.baseUrl + UrlConstant.dailyUrl;
    if (isReload) {
      _dailyPageList?.clear();
    }
    return fetchDailyData(url).then((bean) {
      buildDailyPageList(bean);
    });
  }

  Future onLoadMore() {
    return fetchDailyData(_nextPageUrl).then((bean) {
      buildDailyPageList(bean);
      _eventSink.add(RefreshStatus.completed);
    });
  }

  Future onRefresh(bool isReload) {
    return getData(isReload);
  }

  Future<DailyBean> fetchDailyData(String url) async {
    try {
      if (isEmpty(url)) {
        return null;
      }
      debugPrint('---->>>daily page url:' + url);
      var dio = new Dio()
        ..interceptors.add(LogInterceptor());
      Response response = await dio.get(
        url,
        options: Options(
          headers: {
            "User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36",
        })
      );
      var bean = DailyBean.fromJson(response.data);
      return bean;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  var _nextPageUrl;
  void buildDailyPageList(DailyBean data) {
    if (data?.issueList == null || data.issueList.isEmpty ||
        data.issueList[0].itemList == null || data.issueList[0].itemList.isEmpty) {
      return;
    }

    if (_dailyPageList == null || _dailyPageList.length == 0) {
      _dailyPageList = new List();
    }

    for (ItemListBean item in data?.issueList[0]?.itemList) {
      if (item?.type?.compareTo('video') == 0) {
        _dailyPageList.add(item?.data);
      }
    }

    if (_dailyPageList != null && _dailyPageList.length > 0) {
      _dailyPageSink.add(UnmodifiableListView<DataBean>(_dailyPageList));
    }

    _nextPageUrl = data?.nextPageUrl;
  }

  int getLoadStatus(AsyncSnapshot<List<DataBean>> snapshot) {
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