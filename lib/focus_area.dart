import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './colors.dart' as color;

class FocusArea extends StatelessWidget {
  const FocusArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Area of focus',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: color.AppColor.homePageTitle,
          ),
        ),
      ],
    );
  }
}
