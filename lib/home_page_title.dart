import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './colors.dart' as color;

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Training',
          style: TextStyle(
              fontSize: 30,
              color: color.AppColor.homePageTitle,
              fontWeight: FontWeight.w700),
        ),
        Expanded(child: Container()),
        Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: color.AppColor.homePageIcons,
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          Icons.calendar_today,
          size: 20,
          color: color.AppColor.homePageIcons,
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: color.AppColor.homePageIcons,
        ),
      ],
    );
  }
}
