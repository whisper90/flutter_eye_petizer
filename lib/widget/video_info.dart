import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import  'package:cached_network_image/cached_network_image.dart';

class VideoInfo extends StatelessWidget {

  final DataBean bean;
  const VideoInfo(this.bean, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0.0),
            child: Text(
              bean?.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            child: Text(
              '#${bean?.category} / 开眼精选',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              bean?.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite_border, color: Colors.white),
                          Text(
                            '${bean?.consumption?.collectionCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.share, color: Colors.white),
                          Text(
                            '${bean?.consumption?.shareCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.reply, color: Colors.white),
                          Text(
                            '${bean?.consumption?.replyCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
            height: 1.0,
            color: Colors.white30,
          ),
          Container(
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
                        bean?.author?.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        bean?.author?.description,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12.0
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Text(
                    '+关注',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
            height: 1.0,
            color: Colors.white30,
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0, bottom: 0.0),
            child: Text(
              '相关推荐',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold
              ),
            )
          )
        ],
      ),
    );
  }
}