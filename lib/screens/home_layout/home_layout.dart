
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/check_internet/internet_cubit/check_internet_cubit.dart';
import 'package:quran_app/check_internet/internet_cubit/check_internet_states.dart';
import 'package:quran_app/screens/ad3ya/ad3ya_screen.dart';
import 'package:quran_app/screens/askar/askar_screen.dart';
import 'package:quran_app/screens/quran/juz/pdf_screen.dart';
import 'package:quran_app/screens/sebha/sebha_screen.dart';
import 'package:quran_app/screens/surah_screen.dart';

import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';

import 'home_cubit/home_cubit.dart';
import 'home_cubit/home_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckInternetCubit()..checkInternet(),
      child: BlocListener<CheckInternetCubit, CheckInternetState>(
        listener: (context, state) {
          if (state is InternetNotConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is InternetConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: BlocProvider(
          create: (context) => HomeCubit()..getChapters(),
          child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              return Scaffold(
                drawer: Drawer(
                  backgroundColor: AppColor.mainColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      DrawerHeader(
                        child: Container(
                            height: Dimensions.height130,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/images/allah.png",
                            )),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return SurahScreen(chaptersModel: cubit.chaptersModel);
                              }));
                        },
                        child: Text(
                          'Surah',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                       GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return PdfScreen(num: 569,);
                              }));
                        },
                        child: Text(
                          'Quran',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return AskarScreen();
                              }));
                        },
                        child: Text(
                          'ASKAR',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.of(context).pop();
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return AdayaScreen();
                              }));
                        },
                        child: Text(
                          'Ad3ya',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(
                        height: 45,
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.of(context).pop();
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return SebhaScreen();
                              }));
                        },
                        child: Text(
                          'Sebha',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      SizedBox(
                        height: 45,
                      ),
                      
                    ],
                  ),
                ),
                body: cubit.bottomScreen[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: AppColor.mainColor,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottom(index);
                  },
                  selectedItemColor: AppColor.buttonBackgroundColor,
                  items: [
                    BottomNavigationBarItem(
                      icon: CircleAvatar(
                        radius: 20,
                        child: Image.asset(
                          "assets/images/icon4.png",
                        ),
                        backgroundColor: AppColor.iconColor2.withOpacity(.5),
                      ),
                      label: 'Profile',
                      activeIcon: CircleAvatar(
                        radius: 25,
                        //backgroundColor: AppColor.iconColor2.withOpacity(.5),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColor.iconColor1,
                          child: CircleAvatar(
                            radius: 23,
                            child: Image.asset(
                              "assets/images/icon4.png",
                            ),
                            backgroundColor:
                                AppColor.iconColor2.withOpacity(.3),
                          ),
                        ),
                      ),
                    ),
                    /////////////
                    BottomNavigationBarItem(
                      icon: CircleAvatar(
                        radius: 20,
                        child: Image.asset(
                          "assets/images/icon2.png",
                        ),
                        backgroundColor: AppColor.iconColor2.withOpacity(.5),
                      ),
                      label: 'Profile',
                      activeIcon: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColor.iconColor2.withOpacity(.5),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColor.iconColor1,
                          child: CircleAvatar(
                            radius: 23,
                            child: Image.asset(
                              "assets/images/icon2.png",
                            ),
                            backgroundColor:
                                AppColor.iconColor2.withOpacity(.3),
                          ),
                        ),
                      ),
                    ),
                    ///////////
                    BottomNavigationBarItem(
                      icon: CircleAvatar(
                        radius: 20,
                        child: Image.asset(
                          "assets/images/icon3.png",
                        ),
                        backgroundColor: AppColor.iconColor2.withOpacity(.5),
                      ),
                      label: 'Profile',
                      activeIcon: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColor.iconColor2.withOpacity(.5),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColor.iconColor1,
                          child: CircleAvatar(
                            radius: 23,
                            child: Image.asset(
                              "assets/images/icon3.png",
                            ),
                            backgroundColor:
                                AppColor.iconColor2.withOpacity(.3),
                          ),
                        ),
                      ),
                    ),
                    //////////
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
