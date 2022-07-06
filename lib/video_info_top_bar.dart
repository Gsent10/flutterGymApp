import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/home_page.dart';

import './colors.dart' as color;

class ViTopBar extends StatelessWidget {
  final Function pauseVid;

  ViTopBar(this.pauseVid);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 70,
        left: 30,
        right: 30,
      ),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  pauseVid();
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
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Legs Toning',
            style: TextStyle(
              fontSize: 25,
              color: color.AppColor.secondPageTitleColor,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'and Glutes Workout',
            style: TextStyle(
              fontSize: 25,
              color: color.AppColor.secondPageTitleColor,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Container(
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.secondPageContainerGradient1stColor,
                      color.AppColor.secondPageContainerGradient2ndColor,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      size: 20,
                      color: color.AppColor.secondPageIconColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "68 min",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.secondPageIconColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 210,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.secondPageContainerGradient1stColor,
                      color.AppColor.secondPageContainerGradient2ndColor,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.handyman_outlined,
                      size: 20,
                      color: color.AppColor.secondPageIconColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Resistant  band, Kettlebell",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.secondPageIconColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
