import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/screens/prayer/prayer_cubit/prayer_cubit.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/small_text.dart';

import 'prayer_cubit/prayer_states.dart';

class PrayerBodyScreen extends StatelessWidget {
  // DateTime currentDate = DateTime.now();
  final double lat, long;
  final DateTime currentDate;
  PrayerBodyScreen(
      {Key? key,
      required this.lat,
      required this.long,
      required this.currentDate})
      : super(key: key);
  int x31 = 30;
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
    print("= " + currentDate.day.toString());
    return BlocProvider(
      create: (context) => PrayerCubit()
        ..getTimingPrayer(
            lat: lat,
            long: long,
            day: currentDate.day == 31 ? x31 : currentDate.day,
            month: currentDate.month,
            year: currentDate.year),
      child: BlocBuilder<PrayerCubit, PrayerStates>(
        builder: (context, state) {
          var cubit = PrayerCubit.get(context);
          if (cubit.isPrayer == true) {
            return Container(
              height: Dimensions.height200 - Dimensions.height20,
              margin: EdgeInsets.only(
                  left: Dimensions.height20,
                  right: Dimensions.height20,
                  top: Dimensions.height20,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColor.paraColor.withOpacity(.4),
                image: DecorationImage(
                    image: AssetImage("assets/images/sl.png"),
                    fit: BoxFit.fill,
                    opacity: .8),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius20)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: Dimensions.height100,
                      width: Dimensions.height100,
                      margin: EdgeInsets.only(
                          left: Dimensions.height10,
                          bottom: Dimensions.height10,
                          right: Dimensions.height10 / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                              text: time[0],
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          SmallText(
                              text: cubit.prayerTimesModel.data[currentDate.day]
                                  .timings.Fajr,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                    Container(
                      height: Dimensions.height100,
                      width: Dimensions.height100,
                      margin: EdgeInsets.only(
                          left: Dimensions.height10,
                          bottom: Dimensions.height10,
                          right: Dimensions.height10 / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                              text: time[2],
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          SmallText(
                              text: cubit.prayerTimesModel.data[currentDate.day]
                                  .timings.Dhuhr,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                    Container(
                      height: Dimensions.height100,
                      width: Dimensions.height100,
                      margin: EdgeInsets.only(
                          left: Dimensions.height10,
                          bottom: Dimensions.height10,
                          right: Dimensions.height10 / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                              text: time[3],
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          SmallText(
                              text: cubit.prayerTimesModel.data[currentDate.day]
                                  .timings.Asr,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                    Container(
                      height: Dimensions.height100,
                      width: Dimensions.height100,
                      margin: EdgeInsets.only(
                          left: Dimensions.height10,
                          bottom: Dimensions.height10,
                          right: Dimensions.height10 / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                              text: time[5],
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          SmallText(
                              text: cubit.prayerTimesModel.data[currentDate.day]
                                  .timings.Maghrib,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                    Container(
                      height: Dimensions.height100,
                      width: Dimensions.height100,
                      margin: EdgeInsets.only(
                          left: Dimensions.height10,
                          bottom: Dimensions.height10,
                          right: Dimensions.height10 / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                              text: time[6],
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          SmallText(
                              text: cubit.prayerTimesModel.data[currentDate.day]
                                  .timings.Isha,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
            /* return Container(
                  height:  Dimensions.height150,
                  margin: EdgeInsets.only(left: Dimensions.height20,right: Dimensions.height20,top: Dimensions.height20),
                  decoration: BoxDecoration(
                    color: AppColor.paraColor.withOpacity(.4),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius30),
                        bottomRight: Radius.circular(Dimensions.radius30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                SmallText(
                                    text: "Fajr ",
                                    color: AppColor.textColor,
                                    size: Dimensions.font20,
                                    fontWeight: FontWeight.bold),
                                SmallText(
                                  text: cubit.prayerTimesModel.data[currentDate.day].timings.Fajr,
                                  color: Colors.black38,
                                  size: Dimensions.font15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SmallText(
                                    text: "Dhuhr ",
                                    color: AppColor.textColor,
                                    size: Dimensions.font20,
                                    fontWeight: FontWeight.bold),
                                SmallText(
                                  text: cubit.prayerTimesModel.data[currentDate.day].timings.Dhuhr,
                                  color: Colors.black38,
                                  size: Dimensions.font15,
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                SmallText(
                                    text: "Asr ",
                                    color: AppColor.textColor,
                                    size: Dimensions.font20,
                                    fontWeight: FontWeight.bold),
                                SmallText(
                                  text: cubit.prayerTimesModel.data[currentDate.day].timings.Asr,
                                  color: Colors.black38,
                                  size: Dimensions.font15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SmallText(
                                    text: "Maghrib ",
                                    color: AppColor.textColor,
                                    size: Dimensions.font20,
                                    fontWeight: FontWeight.bold),
                                SmallText(
                                  text: cubit.prayerTimesModel.data[currentDate.day].timings.Maghrib,
                                  color: Colors.black38,
                                  size: Dimensions.font15,
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                                children: [
                                  SmallText(
                                      text: "Isha ",
                                      color: AppColor.textColor,
                                      size: Dimensions.font20,
                                      fontWeight: FontWeight.bold),
                                  SmallText(
                                    text: cubit.prayerTimesModel.data[currentDate.day].timings.Isha,
                                    color: Colors.black38,
                                    size: Dimensions.font15,
                                  ),
                                ],
                              ),
                        ),
                      ],
                    ),
                  ),
                );*/
          } else if (state is PrayerLoadingState) {
            return Container(
              height: Dimensions.height200 - Dimensions.height20,
              margin: EdgeInsets.only(
                  left: Dimensions.height20,
                  right: Dimensions.height20,
                  top: Dimensions.height20,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColor.paraColor.withOpacity(.4),
                image: DecorationImage(
                    image: AssetImage("assets/images/sl.png"),
                    fit: BoxFit.fill,
                    opacity: .8),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius20)),
              ),
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return Container(
              height: Dimensions.height200 - Dimensions.height20,
              margin: EdgeInsets.only(
                  left: Dimensions.height20,
                  right: Dimensions.height20,
                  top: Dimensions.height20,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColor.paraColor.withOpacity(.4),
                image: DecorationImage(
                    image: AssetImage("assets/images/sl.png"),
                    fit: BoxFit.fill,
                    opacity: .8),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius20)),
              ),
            );
          }
        },
      ),
    );
  }
}
