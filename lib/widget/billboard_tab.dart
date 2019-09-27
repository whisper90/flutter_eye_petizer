import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import 'package:flutter_eye_petizer/bloc/billboard_tab_bloc.dart';
import 'package:flutter_eye_petizer/bloc/bloc_provider.dart';
import 'package:flutter_eye_petizer/widget/daily_item.dart';
import 'package:flutter_eye_petizer/widget/refresh_scaffold.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BillboardTab extends StatefulWidget {

  final String billboardType;
  BillboardTab({Key key, @required this.billboardType}) : super(key: key);

  @override
  _BillboardTabState createState() => new _BillboardTabState();
}

class _BillboardTabState extends State<BillboardTab> {

  BillboardBloc _bloc;

  @override
  void initState() {
    super.initState();
    debugPrint('--->>>billboard tab initstate');
    _bloc = new BillboardBloc(billboardType: widget.billboardType);
    _bloc.getData(true);
  }

  @override
  Widget build(BuildContext context) {
    var _controller = new RefreshController();
    _bloc.eventStream.listen((event) {
      if (event == RefreshStatus.completed) {
        _controller.loadComplete();
      }
    });

    return BlocProvider<BillboardBloc>(
      bloc: _bloc,
      child: new StreamBuilder(
        stream: _bloc.billboardSteam,
        builder:
            (BuildContext context, AsyncSnapshot<List<DataBean>> snapshot) {
          debugPrint('---->>>buildcontext snapshot');
          return new RefreshScaffold(
            labelId: '',
            loadStatus: _bloc.getLoadStatus(snapshot),
            refreshController: _controller,
            enablePullUp: _bloc.enablePullUp(),
            onLoadMore: () {
              debugPrint('--->>>onLoadMore');
              return _bloc.onLoadMore();
            },
            onRefresh: ({isReload: true}) {
              debugPrint('--->>>onRefresh');
              return _bloc.onRefresh(isReload);
            },
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                itemCount: snapshot?.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) =>
                new DailyItem(snapshot.data[index])
            ),
          );
        }
      ),
    );
  }

  @override
  void setState(fn) {
    super.setState(fn);
    debugPrint('--->>>billboard tab setState');
  }

  @override
  void deactivate() {
    debugPrint('--->>>billboard tab  deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('--->>>billboard tab  dispose');
    super.dispose();
  }
}