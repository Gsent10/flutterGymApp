import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './home_page_title.dart';
import './detail_row.dart';
import './header.dart';
import './doing_great.dart';
import './focus_area.dart';
import './excercises.dart';

import './colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            HomePageTitle(),
            SizedBox(
              height: 30,
            ),
            DetailRow(),
            SizedBox(
              height: 30,
            ),
            HeaderSection(),
            SizedBox(
              height: 30,
            ),
            Great(),
            SizedBox(
              height: 30,
            ),
            FocusArea(),
            Excercises(info),
          ],
        ),
      ),
    );
  }
}
