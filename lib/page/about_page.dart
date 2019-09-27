import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('关于'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        alignment: Alignment.topCenter,
        child: Text(
          '接口数据全部来源自Eyepetizer|开眼视频\n本app遵从GPL License v3.0'
        ),
      ),
    );
  }
}