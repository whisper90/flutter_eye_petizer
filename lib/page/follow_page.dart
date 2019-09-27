import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bloc/follow_page_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_eye_petizer/bloc/bloc_provider.dart';
import 'package:flutter_eye_petizer/bean/follow_bean.dart';
import 'package:flutter_eye_petizer/widget/refresh_scaffold.dart';
import 'package:flutter_eye_petizer/widget/follow_item.dart';

///
/// @author whisper90
/// 关注tab
///
class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => new _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {

  FollowPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    debugPrint('--->>>followpage initstate');
    _bloc = new FollowPageBloc();
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

    return BlocProvider<FollowPageBloc>(
      bloc: _bloc,
      child: new StreamBuilder(
          stream: _bloc.followPageSteam,
          builder:
              (BuildContext context, AsyncSnapshot<List<FollowDataBean>> snapshot) {
            debugPrint('---->>>buildcontext snapshot');
            return new Scaffold(
              appBar: AppBar(
                title: Text('关注'),
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
                    new FollowItem(snapshot.data[index])
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
    debugPrint('--->>>followpage setState');
  }

  @override
  void deactivate() {
    debugPrint('--->>>followpage deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('--->>>followpage dispose');
    super.dispose();
  }
}