import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' hide RefreshIndicator;
import 'package:flutter_eye_petizer/widget/multi_status_layout.dart';

typedef OnLoadMore = void Function();
typedef OnRefresh = Future<void> Function({bool isReload});

class RefreshScaffold extends StatefulWidget {
  final String labelId;
  final int loadStatus;
  final RefreshController refreshController;
  final bool enablePullUp;
  final OnRefresh onRefresh;
  final OnLoadMore onLoadMore;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const RefreshScaffold({
    Key key,
    this.labelId,
    this.loadStatus,
    @required this.refreshController,
    this.enablePullUp: true,
    this.onRefresh,
    this.onLoadMore,
    this.child,
    this.itemCount,
    this.itemBuilder
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _RefreshScaffoldState();
}

class _RefreshScaffoldState extends State<RefreshScaffold>
  with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    debugPrint('RefreshScaffold initState');
    WidgetsBinding.instance.addPostFrameCallback((duration) {
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new RefreshIndicator(
            child: new SmartRefresher(
              controller: widget.refreshController,
              enablePullDown: false,
              enablePullUp: widget.enablePullUp,
              onLoading: widget.onLoadMore,
              child: widget.child ??
                new ListView.builder(
                  itemCount: widget.itemCount,
                  itemBuilder: widget.itemBuilder)
            ),
            onRefresh: widget.onRefresh,
          ),
          new MultiStatusLayout(
            widget.loadStatus,
            onTap: () {
              widget.onRefresh(isReload: true);
            },
          )
        ],
      )
    );
  }

  @override
  void dispose() {
    widget.refreshController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
