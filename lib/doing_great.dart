import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './colors.dart' as color;

class Great extends StatelessWidget {
  const Great({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/card.png"),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  offset: Offset(8, 10),
                  color: color.AppColor.gradientSecond.withOpacity(0.4),
                ),
                BoxShadow(
                  blurRadius: 40,
                  offset: Offset(-1, -5),
                  color: color.AppColor.gradientSecond.withOpacity(0.4),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              right: 200,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/figure.png"),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 100,
            margin: EdgeInsets.only(
              left: 150,
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You are doing great',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Keep it up\n',
                    style: TextStyle(
                      color: color.AppColor.homePagePlanColor,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(text: 'Stick to your plan'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
