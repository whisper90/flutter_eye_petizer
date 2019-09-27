import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/follow_bean.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import  'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_eye_petizer/util/time_util.dart';
import 'package:flutter_eye_petizer/page/play_page.dart';

class FollowItem extends StatelessWidget {

  final FollowDataBean bean;
  const FollowItem(this.bean, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataBean = bean?.content?.data;

    return new InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new PlayPage(bean: dataBean)));
      },
      child: new Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipOval(
                  child: CachedNetworkImage(
                    width: 35.0,
                    height: 35.0,
                    imageUrl: dataBean?.author?.icon ?? bean?.header?.icon,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dataBean?.author?.name ?? bean?.header?.issuerName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '发布:  ',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          dataBean?.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
            ),
            Text(
              dataBean?.description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
            ),
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
                          imageUrl: dataBean?.cover?.homepage ?? dataBean?.cover?.detail ,
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
                          TimeUtil.parseTimeFromDuration(dataBean?.duration),
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