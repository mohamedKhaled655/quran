import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/screens/prayer/prayer_body_screen.dart';
import 'package:quran_app/screens/prayer/prayer_cubit/prayer_cubit.dart';
import 'package:quran_app/screens/prayer/prayer_cubit/prayer_states.dart';
import 'package:quran_app/shared/services/services_location.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/big_text.dart';
import 'package:quran_app/widget/custom_app_bar.dart';

class PrayerScreen extends StatefulWidget {
  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  DateTime currentDate = DateTime.now();
  //DateTime currentDate1 = DateTime.parse("${DateTime.now().year}-${DateTime.now().month}-31:00:00.000");

  DateTime firstData = DateTime(
    1999,
  );
  DateTime sectData = DateTime(
    2033,
  );
  ServicesLocation servicesLocation = ServicesLocation();
  //double lat = 29.311955;
  //double lang = 30.659410;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //servicesLocation.getPostion(context);
    //servicesLocation.getLatAndLang();
    //getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerCubit()..getLoc(context),
      child: Scaffold(
        body: Column(
          children: [
          const  CustomAppBar(),

            BlocBuilder<PrayerCubit, PrayerStates>(
              builder: (context, state) {
                var cubit = PrayerCubit.get(context);
                if (state is ServicesLocationSuccessState) {
                  print(cubit.lat);

                  return PrayerBodyScreen(
                    lat: cubit.lat,
                    long: cubit.lang,

                    day:(currentDate.day==31)?30: currentDate.day,
                    month:currentDate.month ,
                    year: currentDate.year,
                  );
                } else {
                  return Expanded(
                    flex:2,
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
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius20)),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  );
                }
              },
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: Dimensions.screenWidth - 50,
                height: Dimensions.height200 * 1.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.radius30),
                      bottomRight: Radius.circular(Dimensions.radius30)),
                  color: AppColor.paraColor.withOpacity(.4),
                ),
                child: CalendarDatePicker(
                  firstDate: firstData,
                  lastDate: sectData,
                  initialDate: currentDate,
                  currentDate: currentDate,
                  initialCalendarMode: DatePickerMode.day,
                  onDateChanged: (DateTime dateTime) {
                    setState(() {
                      currentDate = dateTime;
                      print("currentDate = ");
                      print(currentDate);
                    });
                  },
                ),
              ),
            ),
            // Text(lat.toString()),
          //  const Spacer(),
              Expanded(
              flex: 1,
              child: Container(
                height: Dimensions.height30 * 2 + Dimensions.height10,
                margin:
                   const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: AppColor.paraColor.withOpacity(.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            right: Dimensions.height20,
                            left: Dimensions.height20),
                        child: BigText(
                          text: "Direction",
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.open_in_new_sharp,
                        color: AppColor.iconColor1,
                        size: Dimensions.font30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           const  Divider(),
          ],
        ),
      ),
    );
  }
}
