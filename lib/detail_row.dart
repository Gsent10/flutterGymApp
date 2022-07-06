import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/video_info_page.dart';

import './colors.dart' as color;

class DetailRow extends StatelessWidget {
  const DetailRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Your Program',
          style: TextStyle(
            fontSize: 20,
            color: color.AppColor.homePageSubtitle,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(child: Container()),
        Text(
          'Details',
          style: TextStyle(
            fontSize: 20,
            color: color.AppColor.homePageDetail,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            Get.to(() => VideoInfoPage());
          },
          child: Icon(
            Icons.arrow_forward,
            size: 20,
            color: color.AppColor.homePageIcons,
          ),
        )
      ],
    );
  }
}
