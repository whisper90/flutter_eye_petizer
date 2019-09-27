import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_eye_petizer/util/time_util.dart';

class RelatedItem extends StatelessWidget {

  final DataBean bean;
  final List<DataBean> datas;
  const RelatedItem(this.bean, this.datas, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (datas == null || datas.length <= 0) {
      return new Container(height: 0.0);
    }
    return new Column(
      children: datas.map((dataBean) {
        return InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 16.0 / 9.0,
                        child: new Container(
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(6.0),
                            child: CachedNetworkImage(
                              imageUrl: dataBean?.cover?.homepage ??
                                  dataBean?.cover?.detail,
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  Icon(Icons.info),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
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
                            TimeUtil.parseTimeFromDuration(
                                dataBean?.duration),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0
                            )
                          ),
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0)
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        dataBean?.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0)
                      ),
                      Text(
                        '#${dataBean?.category}',
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                )
              ]
            ),
          )
        );
      }).toList(),
    );
  }
}