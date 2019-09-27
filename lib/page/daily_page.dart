import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bloc/daily_page_bloc.dart';
import 'package:flutter_eye_petizer/bloc/bloc_provider.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import 'package:flutter_eye_petizer/widget/refresh_scaffold.dart';
import 'package:flutter_eye_petizer/widget/daily_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
/// @author whisper90
/// 日报tab
///
class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => new _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {

  DailyPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    debugPrint('--->>>dailypage initstate');
    _bloc = new DailyPageBloc();
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

    return BlocProvider<DailyPageBloc>(
      bloc: _bloc,
      child: new StreamBuilder(
        stream: _bloc.dailyPageSteam,
        builder:
            (BuildContext context, AsyncSnapshot<List<DataBean>> snapshot) {
          debugPrint('---->>>buildcontext snapshot');
          return new Scaffold(
            appBar: AppBar(
              title: Text('日报'),
            ),
            body: new RefreshScaffold(
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
            ),
          );
        }
      ),
    );
  }

  @override
  void setState(fn) {
    super.setState(fn);
    debugPrint('--->>>dailypage setState');
  }

  @override
  void deactivate() {
    debugPrint('--->>>dailypage deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('--->>>dailypage dispose');
    super.dispose();
  }
}
