import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eye_petizer/page/about_page.dart';

///
/// @author whisper90
/// 我的tab
///
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context, new CupertinoPageRoute<void>(builder: (ctx) => new AboutPage()));
            }
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            width: 70,
            height: 70,
            child: ClipOval(
              child: Image.asset('images/headlogo.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '点击登录即可评论及发布内容',
              style: TextStyle(color: Colors.grey[600])
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite_border, color: Colors.grey[600],),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                      ),
                      Text('收藏', style: TextStyle(color: Colors.grey[600]))
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey[300],
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.file_download, color: Colors.grey[600],),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                      ),
                      Text('缓存', style: TextStyle(color: Colors.grey[600]),)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(top: 15),
            color: Colors.grey[300],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
                '我的关注',
                style: TextStyle(color: Colors.grey[600])
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
                '通知开关',
                style: TextStyle(color: Colors.grey[600])
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
                '观看记录',
                style: TextStyle(color: Colors.grey[600])
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
                '意见反馈',
                style: TextStyle(color: Colors.grey[600])
            ),
          ),
        ],
      ),
    );
  }
}