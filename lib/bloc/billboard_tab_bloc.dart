import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import 'package:flutter_eye_petizer/bean/billboard_bean.dart';
import 'package:flutter_eye_petizer/constant/url_constant.dart';
import 'package:flutter_eye_petizer/widget/multi_status_layout.dart';
import 'bloc_provider.dart';
import 'package:dio/dio.dart';
import 'package:quiver/strings.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BillboardBloc extends BlocBase {

  final String billboardType;
  BillboardBloc({@required this.billboardType});

  StreamController<List<DataBean>> _controller = StreamController.broadcast();
  Sink<List<DataBean>> get _billboardSink => _controller.sink;
  List<DataBean> _billboardTabList;
  Stream<List<DataBean>> get billboardSteam => _controller.stream;

  StreamController<RefreshStatus> _event = StreamController.broadcast();
  Sink<RefreshStatus> get _eventSink => _event.sink;
  Stream<RefreshStatus> get eventStream => _event.stream;

  @override
  void dispose() {
    debugPrint('--->>>billboardbloc dispose');
    _controller?.close();
    _event?.close();
  }

  @override
  bool enablePullUp() {
    return isEmpty(_nextPageUrl) ? false : true;
  }

  Future getData(bool isReload) {
    String url = UrlConstant.baseUrl;
    switch (billboardType) {
      case 'weekly':
        url = url + '/v4/rankList/videos?strategy=weekly';
        break;
      case 'monthly':
        url = url + '/v4/rankList/videos?strategy=monthly';
        break;
      case 'historical':
        url = url + '/v4/rankList/videos?strategy=historical';
        break;
      default:
        break;
    }

    if (isReload) {
      _billboardTabList?.clear();
    }
    return fetchBillboardData(url).then((bean) {
      buildDailyPageList(bean);
    });
  }

  Future onLoadMore() {
    return fetchBillboardData(_nextPageUrl).then((bean) {
      buildDailyPageList(bean);
      _eventSink.add(RefreshStatus.completed);
    });
  }

  Future onRefresh(bool isReload) {
    return getData(isReload);
  }

  Future<BillboardBean> fetchBillboardData(String url) async {
    try {
      if (isEmpty(url)) {
        return null;
      }
      debugPrint('---->>>billboard url:' + url);
      var dio = new Dio()
        ..interceptors.add(LogInterceptor());
      Response response = await dio.get(
          url,
          options: Options(
              headers: {
                "User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36",
              })
      );
      var bean = BillboardBean.fromJson(response.data);
      return bean;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  var _nextPageUrl;
  void buildDailyPageList(BillboardBean data) {
    if (data?.itemList == null || data.itemList.isEmpty) {
      return;
    }

    if (_billboardTabList == null || _billboardTabList.length == 0) {
      _billboardTabList = new List();
    }

    for (ItemListBean item in data?.itemList) {
      if (item?.type?.compareTo('video') == 0) {
        _billboardTabList.add(item?.data);
      }
    }

    if (_billboardTabList != null && _billboardTabList.length > 0) {
      _billboardSink.add(UnmodifiableListView<DataBean>(_billboardTabList));
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