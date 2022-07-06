import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './colors.dart' as color;

class Excercises extends StatelessWidget {
  final List<dynamic> info;

  Excercises(this.info);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OverflowBox(
        maxWidth: MediaQuery.of(context).size.width,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: (info.length.toDouble() / 2).toInt(),
            itemBuilder: (_, i) {
              int a = 2 * i;
              int b = 2 * i + 1;
              return Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 90) / 2,
                    height: 170,
                    margin: EdgeInsets.only(left: 30, bottom: 15, top: 15),
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(
                          info[a]['img'],
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(5, 5),
                          color: color.AppColor.gradientSecond.withOpacity(0.1),
                        ),
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(-5, -5),
                          color: color.AppColor.gradientSecond.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          info[a]['title'],
                          style: TextStyle(
                            fontSize: 20,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 90) / 2,
                    height: 170,
                    margin: EdgeInsets.only(left: 30, bottom: 15, top: 15),
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(
                          info[b]['img'],
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(5, 5),
                          color: color.AppColor.gradientSecond.withOpacity(0.1),
                        ),
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(-5, -5),
                          color: color.AppColor.gradientSecond.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          info[b]['title'],
                          style: TextStyle(
                            fontSize: 20,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
