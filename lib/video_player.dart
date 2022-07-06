// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import './colors.dart' as color;

class VideoPlayerBar extends StatefulWidget {
  final List<dynamic> videoinfo;
  final VideoPlayerController? _controller;
  final Function tooglePlayBtn;
  final Function onTapVideo;
  final Function toogleVolume;
  final bool isPlaying;
  final int isPlayingindex;
  final Duration? position;
  final Duration? duration;

  VideoPlayerBar(
    this.videoinfo,
    this._controller,
    this.isPlaying,
    this.tooglePlayBtn,
    this.onTapVideo,
    this.toogleVolume,
    this.isPlayingindex,
    this.duration,
    this.position,
  );

  @override
  State<VideoPlayerBar> createState() => _VideoPlayerBarState();
}

class _VideoPlayerBarState extends State<VideoPlayerBar> {
  Widget _playView(BuildContext context) {
    final controller = widget._controller;

    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Loading Video...",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (widget._controller?.value.volume)! > 0;
    final duration = widget.duration?.inSeconds ?? 0;
    final head = widget.position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60);
    final secs = convertTwo(remained % 60);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          color: color.AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Container(
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(50, 0, 0, 0),
                      ),
                    ]),
                  ),
                ),
                onTap: () {
                  widget.toogleVolume(noMute);
                },
              ),
              FlatButton(
                onPressed: () async {
                  final index = widget.isPlayingindex - 1;
                  if (index >= 0 && widget.videoinfo.length >= 0) {
                    bool isNext = true;
                    widget.onTapVideo(index, isNext);
                  } else {
                    Get.snackbar(
                      "Video List",
                      "No more videos in the List",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColor.gradientSecond,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  widget.tooglePlayBtn();
                },
                child: Icon(
                  widget.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  final index = widget.isPlayingindex + 1;
                  final listLength = widget.videoinfo.length - 1;
                  if (index <= listLength) {
                    bool isNext = true;
                    widget.onTapVideo(index, isNext);
                  } else {
                    Get.snackbar(
                      "Video List",
                      "No more videos in the List",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColor.gradientSecond,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Text(
                "$mins:$secs",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 0.1),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.only(
              top: 50,
              left: 30,
              right: 30,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: color.AppColor.secondPageTopIconColor,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: color.AppColor.secondPageTopIconColor,
                )
              ],
            ),
          ),
          _playView(context),
          _controlView(context),
        ],
      ),
    );
  }
}
