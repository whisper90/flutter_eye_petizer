import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import  'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_eye_petizer/util/time_util.dart';
import 'package:flutter_eye_petizer/page/play_page.dart';

class DailyItem extends StatelessWidget {

  final DataBean bean;
  const DailyItem(this.bean, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new PlayPage(bean: bean)));
      },
      child: new Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: new Container(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(6.0),
                      child:  CachedNetworkImage(
                        imageUrl: bean?.cover?.homepage ?? bean?.cover?.detail ,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Icon(Icons.info),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )
                  ),
                ),
                new Positioned(
                  bottom: 5.0,
                  right: 5.0,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(
                      TimeUtil.parseTimeFromDuration(bean?.duration),
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  )
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  new Container(
                    child: ClipOval(
                      child: CachedNetworkImage(
                        width: 40.0,
                        height: 40.0,
                        imageUrl: bean?.author?.icon,
                      ),
                    ),
                    margin: EdgeInsets.only(right: 8.0),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          bean?.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          bean?.author?.name + ' / #' + bean?.category,
                          style: TextStyle(
                            color: Colors.grey,
                          )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.share, color: Colors.grey),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              height: 1.0,
              color: Colors.grey[200],
            )
          ],
        ),
      ),
    );
  }
}