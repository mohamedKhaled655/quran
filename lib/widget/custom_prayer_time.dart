import 'package:flutter/material.dart';
import 'package:quran_app/utills/diminsions.dart';

import 'small_text.dart';

class CustomPrayerTime extends StatelessWidget {
  final int timeIndex;

  final String titleName;
  final double left,right;
  CustomPrayerTime({Key? key,required this.timeIndex,required this.titleName, this.left=10, this.right=5}) : super(key: key);
  List time = [
    "Fajr",
    "Sunrise",
    "Dhuhr",
    "Asr",
    "Sunset",
    "Maghrib",
    "Isha",
    "Imsak",
    "Midnight",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height100,
      width: Dimensions.height100,
      margin: EdgeInsets.only(
          left: left,
          bottom: Dimensions.height10,
          right:right),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Expanded(child: Container()),
          Expanded(
            child: SmallText(
                text: time[timeIndex],
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),

          Expanded(
            flex: 2,
            child: SmallText(
                text:titleName,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}