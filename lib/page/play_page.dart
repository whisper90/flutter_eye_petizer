import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/bean/daily_bean.dart';
import 'package:flutter_eye_petizer/bloc/play_page_bloc.dart';
import 'package:flutter_eye_petizer/widget/custom_linear_progress_indicator.dart';
import 'package:video_player/video_player.dart' hide VideoProgressIndicator;
import 'package:flutter_eye_petizer/widget/video_info.dart';
import 'package:flutter_eye_petizer/widget/related_item.dart';
import 'package:flutter_eye_petizer/bloc/bloc_provider.dart';
import 'package:flutter_eye_petizer/util/time_util.dart';
import 'dart:async';

///
/// @author whisper90
/// 小视频播放
///
class PlayPage extends StatefulWidget {

  final DataBean bean;
  PlayPage({Key key, @required this.bean}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {

  VoidCallback listener;
  bool display = false;
  PlayPageBloc _bloc;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    
    _controller = VideoPlayerController.network(
        widget.bean?.playUrl?.replaceAll('http://', 'http://'))
      ..setLooping(false);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize()
        .then((_) {setState(() {
      debugPrint('initialize success');
      _controller.play();
    });});

    listener = updateState;

    _bloc = new PlayPageBloc();
    _bloc.getData(widget.bean?.id);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top,),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                widget.bean?.cover?.blurred
            )
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            buildVideoPlayItem(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  VideoInfo(widget.bean),
                  BlocProvider<PlayPageBloc>(
                    bloc: _bloc,
                    child: new StreamBuilder(
                        stream: _bloc.playPageStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<DataBean>> snapshot) {
                          return RelatedItem(widget.bean, snapshot.data);
                        }),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Widget buildVideoPlayItem() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          debugPrint('initialize success build widget');
          return AspectRatio(
            aspectRatio: 16.0 / 9.0,
            // Use the VideoPlayer widget to display the video.
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    displayController();
                  },
                  child: VideoPlayer(_controller),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    padding: EdgeInsets.all(0.0),
                  ),
                ),
                controller()
              ],
            ),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: CachedNetworkImage(
                  imageUrl: widget.bean?.cover?.homepage ?? widget.bean?.cover?.detail,
                  fit: BoxFit.fill,
                ),
              ),
              CircularProgressIndicator()
            ],
          );
        }
      },
    );
  }

  void controlPlayOrPause() {
    setState(() {
      // If the video is playing, pause it.
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
      debugPrint('controlPlayOrPause $display');
      removeTimerAndListener();
      hideController();
    });
  }

  void removeTimerAndListener() {
    mTimer?.cancel();
    mTimer = null;
    _controller?.removeListener(listener);
  }

  void updateState() {
    setState(() {
    });
  }

  Timer mTimer;
  void hideController() {
    _controller.addListener(listener);
    const timeout = const Duration(seconds: 4);
    mTimer = Timer(timeout, () {
      display = false;
      updateState();
      _controller.removeListener(listener);
    });
  }

  void displayController() {
    setState(() {
      display = !display;
      display ? hideController() : removeTimerAndListener();
      debugPrint('display $display');
    });
  }

  Widget controller() {
    return Visibility(
        visible: display,
        child: GestureDetector(
          onTap: () {
            displayController();
          },
          child: Container(
            color: Color.fromARGB(128, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  onPressed: controlPlayOrPause,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      TimeUtil.parseTimeFromDuration(_controller.value.position.inSeconds),
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Text(
                      ' / ' + TimeUtil.parseTimeFromDuration(_controller.value.duration.inSeconds),
                      style: TextStyle(
                          color: Colors.white
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        )
    );
  }

  @override
  void dispose() {
    removeTimerAndListener();
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller?.dispose();

    super.dispose();
  }
}
