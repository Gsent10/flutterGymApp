import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './colors.dart' as color;

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.8),
              color.AppColor.gradientSecond.withOpacity(0.9),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(80),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(10, 10),
              blurRadius: 10,
              color: color.AppColor.gradientSecond.withOpacity(0.2),
            )
          ]),
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Next Workout',
              style: TextStyle(
                fontSize: 16,
                color: color.AppColor.homePageContainerTextSmall,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Legs Toning',
              style: TextStyle(
                fontSize: 25,
                color: color.AppColor.homePageContainerTextSmall,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'and Glutes Workout',
              style: TextStyle(
                fontSize: 25,
                color: color.AppColor.homePageContainerTextSmall,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.timer,
                      size: 20,
                      color: color.AppColor.homePageContainerTextSmall,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '60 min',
                      style: TextStyle(
                        fontSize: 14,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: color.AppColor.gradientFirst,
                        blurRadius: 10,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 60,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
