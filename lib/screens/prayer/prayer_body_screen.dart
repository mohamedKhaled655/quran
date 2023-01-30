import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/screens/prayer/prayer_cubit/prayer_cubit.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/custom_prayer_time.dart';

import 'prayer_cubit/prayer_states.dart';

class PrayerBodyScreen extends StatelessWidget {
  final double lat, long;
  final  int day;
  final  int month;
  final  int year;
  PrayerBodyScreen(
      {Key? key,
      required this.lat,
      required this.long,
     // required this.currentDate,
        required this.day,required this.month,required this.year})
      : super(key: key);

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
    //print("= " + currentDate.day.toString());
    return BlocProvider(
      create: (context) => PrayerCubit()
        ..getTimingPrayer(
            lat: lat,
            long: long,

          day: day,
          month: month,
          year: year,
        ),
      child: BlocBuilder<PrayerCubit, PrayerStates>(
        builder: (context, state) {
          var cubit = PrayerCubit.get(context);
          if (cubit.isPrayer == true) {
            return  Expanded(
              flex: 2,
              child: Container(
                height: Dimensions.height200 - Dimensions.height20,
                margin: EdgeInsets.only(
                    left: Dimensions.height20,
                    right: Dimensions.height20,
                    top: Dimensions.height20,
                    bottom: Dimensions.height20),
                decoration: BoxDecoration(
                  color: AppColor.paraColor.withOpacity(.4),
                  image:const DecorationImage(
                      image: AssetImage("assets/images/sl.png"),
                      fit: BoxFit.fill,
                      opacity: .8),
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius20)),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomPrayerTime(
                          timeIndex: 0,
                          titleName: cubit.prayerTimesModel.data[day].timings.Fajr,
                          right: Dimensions.height10 / 2,
                          left:Dimensions.height10*2 ,
                        ),
                        CustomPrayerTime(
                          timeIndex: 2,
                          titleName: cubit.prayerTimesModel.data[day].timings.Dhuhr,
                          right: Dimensions.height10 / 2,
                          left:Dimensions.height10 ,
                        ),

                        CustomPrayerTime(
                          timeIndex: 3,
                          titleName: cubit.prayerTimesModel.data[day]
                              .timings.Asr,
                          right: Dimensions.height10 / 2,
                          left:Dimensions.height10 ,
                        ),

                        CustomPrayerTime(
                          timeIndex: 5,
                          titleName: cubit.prayerTimesModel.data[day]
                              .timings.Maghrib,
                          right: Dimensions.height10 / 2,
                          left:Dimensions.height10 ,
                        ),

                        CustomPrayerTime(
                          timeIndex: 6,
                          titleName: cubit.prayerTimesModel.data[day]
                              .timings.Isha,
                          right: Dimensions.height10 *2,
                          left:Dimensions.height10 ,
                        ),
                        

                      ],
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
            return Expanded(
              flex: 2,
              child: Container(
                height: Dimensions.height200 - Dimensions.height20,
                margin: EdgeInsets.only(
                    left: Dimensions.height20,
                    right: Dimensions.height20,
                    top: Dimensions.height20,
                    bottom: Dimensions.height20),
                decoration: BoxDecoration(
                  color: AppColor.paraColor.withOpacity(.4),
                  image:const DecorationImage(
                      image: AssetImage("assets/images/sl.png"),
                      fit: BoxFit.fill,
                      opacity: .8),
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius20)),
                ),
                child:const Center(child: CircularProgressIndicator()),
              ),
            );
          } else {
            return Expanded(
              flex: 2,
              child: Container(
                height: Dimensions.height200 - Dimensions.height20,
                margin: EdgeInsets.only(
                    left: Dimensions.height20,
                    right: Dimensions.height20,
                    top: Dimensions.height20,
                    bottom: Dimensions.height20),
                decoration: BoxDecoration(
                  color: AppColor.paraColor.withOpacity(.4),
                  image:const DecorationImage(
                      image: AssetImage("assets/images/sl.png"),
                      fit: BoxFit.fill,
                      opacity: .8),
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius20)),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}


