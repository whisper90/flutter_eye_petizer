import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/util/color_util.dart';
import 'circular_progress.dart';

class MultiStatusLayout extends StatelessWidget {

  static const int error = -1;
  static const int success = 0;
  static const int loading = 1;
  static const int empty = 2;

  final int status;
  final GestureTapCallback onTap;
  const MultiStatusLayout(this.status, {Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(status) {
      case error:
        return new Container(
          color: ColorUtil.hexToColor('#fcfafa'),
          child: new InkWell(
            onTap: () => onTap,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'images/multi_network_error_icon.png',
                ),
                new Text(
                  '网络异常, 请检查后点击屏幕重新加载!'
                ),
              ],
            ),
          ),
        );
        break;
      case loading:
        return new Container(
          alignment: Alignment.center,
          color: ColorUtil.hexToColor('#fcfafa'),
          child: new CircularProgress(),
        );
        break;
      case empty:
        return new Container(
          color: ColorUtil.hexToColor('#fcfafa'),
          child: new InkWell(
            onTap: () => onTap,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                    '暂无数据'
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return Container();
    }
  }
}