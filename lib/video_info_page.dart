// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import './colors.dart' as color;

import './video_info_top_bar.dart';
import './videos_white_bg.dart';
import './video_player.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({Key? key}) : super(key: key);

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  List videoinfo = [];
  bool _playArea = false;
  int indexValue = 0;
  bool _isplaying = false;

  void _tooglePlayArea(int index) {
    setState(() {
      if (_playArea == false) {
        _playArea = true;
      }
    });
  }

  late VideoPlayerController? _controller;

  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async {
    final controller = _controller;

    if (controller == null) {
      debugPrint("Controller is Null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("Controller cannot be initialized");
    }
    final playing = controller.value.isPlaying;
    _isplaying = playing;

    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;
    if (playing) {
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
  }

  _onTapVideo(int index, bool isNext) {
    indexValue = index;

    if (isNext) {
      _controller?.pause();
    }

    final controller = VideoPlayerController.network(
      videoinfo[index]["videoUrl"],
    );

    _controller = controller;

    setState(() {});

    controller
      ..initialize().then((_) {
        controller.addListener(_onControllerUpdate);
        _controller?.play();

        setState(() {});
      });
  }

  _tooglePlayBtn() {
    if (_isplaying) {
      setState(() {
        _isplaying = false;
      });
      _controller?.pause();
    } else {
      setState(() {
        _isplaying = true;
      });
      _controller?.play();
    }
  }

  _toogleVolume(bool noMute) {
    if (noMute) {
      _controller?.setVolume(0);
    } else {
      _controller?.setVolume(1.0);
    }
    setState(() {});
  }

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoinfo = json.decode(value);
      });
    });
  }

  @override
  initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _controller?.pause();
    _controller?.dispose();
    _controller = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(
                color: color.AppColor.gradientSecond,
              ),
        child: Column(
          children: [
            _playArea == false
                ? ViTopBar(_tooglePlayBtn)
                : VideoPlayerBar(
                    videoinfo,
                    _controller,
                    _isplaying,
                    _tooglePlayBtn,
                    _onTapVideo,
                    _toogleVolume,
                    indexValue,
                    _duration,
                    _position),
            VideosWhite(videoinfo, _tooglePlayArea, _onTapVideo, _isplaying),
          ],
        ),
      ),
    );
  }
}
