import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/widget/billboard_tab.dart';

///
/// @author whisper90
/// 榜单tab
///
class BillboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _BillboardPageState();
}

class _BillboardPageState extends State<BillboardPage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: items.length,
      child: Container(
        child: Scaffold(
          appBar: new AppBar(
            title: new TabBar(
              tabs: <Widget>[
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(items[0].title, style: TextStyle(fontSize: 16),)
                ),
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(items[1].title, style: TextStyle(fontSize: 16))
                ),
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(items[2].title, style: TextStyle(fontSize: 16))
                )
              ],
            ),
          ),
          body: TabBarView(
            children: items.map((ItemView item) {
              return new BillboardTab(billboardType: item.billboardType,);
            }).toList(),
          ),
        ),
      )
    );
  }
}

class ItemView {
  const ItemView({this.title, this.icon, this.billboardType});
  final String title;
  final IconData icon;
  final String billboardType;
}

const List<ItemView> items = const <ItemView>[
  const ItemView(title: '周排行', icon: Icons.directions_car, billboardType: 'weekly'),
  const ItemView(title: '月排行', icon: Icons.directions_bike, billboardType: 'monthly'),
  const ItemView(title: '总排行', icon: Icons.directions_boat, billboardType: 'historical'),
];

class SelectedView extends StatelessWidget {

  final ItemView item;
  const SelectedView({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(item.icon, size: 128.0, color: textStyle.color,),
            new Text(item.title, style: textStyle,)
          ],
        ),
      ),
    );
  }
}