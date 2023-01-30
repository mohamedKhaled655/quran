
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/check_internet/internet_cubit/check_internet_cubit.dart';
import 'package:quran_app/check_internet/internet_cubit/check_internet_states.dart';
import 'package:quran_app/screens/ad3ya/ad3ya_screen.dart';
import 'package:quran_app/screens/askar/askar_screen.dart';
import 'package:quran_app/screens/quran/surah/setting.dart';
import 'package:quran_app/screens/quran/surah/test.dart';
import 'package:quran_app/screens/sebha/sebha_screen.dart';
import 'package:quran_app/screens/surah_screen.dart';

import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/customLoad.dart';

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
                  child: ListView(
                    children: <Widget>[
                       SizedBox(
                        height: Dimensions.height10*3,
                      ),
                      DrawerHeader(
                        child: Container(
                            height: Dimensions.height130,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/images/allah.png",
                            )),
                        decoration:const BoxDecoration(
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
                                return (cubit.isChapter==false)? const CustomLoading():SurahScreen(chaptersModel: cubit.chaptersModel);
                              }));
                        },
                        child:const Text(
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
                      height: Dimensions.height10*3.5,
                    ),
                      GestureDetector(
                        onTap: () {
                           Navigator.of(context).pop();
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const TestScreen();
                              }));
                        },
                        child:const Text(
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
                        height: Dimensions.height10*3.5,
                      ),
                      
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const AskarScreen();
                              }));
                        },
                        child:const Text(
                          'Azkar',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10*3.5,
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.of(context).pop();
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const AdayaScreen();
                              }));
                        },
                        child:const Text(
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
                        height: Dimensions.height10*3.5,
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.of(context).pop();
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return SebhaScreen();
                              }));
                        },
                        child:const Text(
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
                        height: Dimensions.height10*3.5,
                      ),
                       GestureDetector(
                        onTap: () {
                           Navigator.of(context).pop();
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const Settings();
                              }));
                        },
                        child:const Text(
                          'Settings',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
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
                  selectedItemColor: AppColor.iconColor1,
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                          "assets/images/icon4.png",
                          color: Colors.black26,

                        ),
                      label: 'Home',
                      activeIcon: Image.asset(
                          "assets/images/icon4.png",
                          color: AppColor.iconColor1,
                          scale:.9 ,
                        ),
                    ),
                    /////////////
                    BottomNavigationBarItem(
                      icon: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                            "assets/images/praying.png",
                            color: Colors.black26,
                          ),
                      ),
                      label: 'Prayer Time',
                      activeIcon:SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.asset(
                            "assets/images/praying.png",
                            color: AppColor.iconColor1,
                            scale: .9,
                            
                          ),
                      ),
                    ),
                    ///////////
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/images/icon3.png",
                        color: Colors.black26,
                      ),
                      label: 'Askar',
                      activeIcon: Image.asset(
                        "assets/images/icon3.png",
                        color: AppColor.iconColor1,
                          scale: .9,
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
