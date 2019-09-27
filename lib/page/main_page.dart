import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/page/daily_page.dart';
import 'package:flutter_eye_petizer/page/follow_page.dart';
import 'package:flutter_eye_petizer/page/billboard_page.dart';
import 'package:flutter_eye_petizer/page/my_page.dart';

///
/// @author whisper90
/// 包含四个底部tab
///
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var _selectedIndex = 0;
  final _pageOptions = [
    '日报',
    '关注',
    '榜单',
    '我的',
  ];

  final _widgetOptions = [
    new DailyPage(),
    new FollowPage(),
    new BillboardPage(),
    new MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: AppBar(
//        title: Text(_pageOptions[_selectedIndex]),
//      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(IconData(0xe603, fontFamily: 'FlutterIcon')), title: Text(_pageOptions[0])),
          BottomNavigationBarItem(icon: Icon(IconData(0xe655, fontFamily: 'FlutterIcon')), title: Text(_pageOptions[1])),
          BottomNavigationBarItem(icon: Icon(IconData(0xe6af, fontFamily: 'FlutterIcon')), title: Text(_pageOptions[2])),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text(_pageOptions[3])),
        ],
        currentIndex: _selectedIndex,
        unselectedFontSize: 12.0,
        selectedFontSize: 12.0,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}