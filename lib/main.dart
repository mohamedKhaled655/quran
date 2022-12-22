import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quran_app/check_internet/internet_cubit/check_internet_cubit.dart';
import 'package:quran_app/check_internet/internet_cubit/check_internet_states.dart';
import 'package:quran_app/screens/home_layout/home_layout.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/widget/check_page.dart';

import 'screens/home_layout/start_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cache_Helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main()async {
 WidgetsFlutterBinding.ensureInitialized();


  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 // Widget widget;
 

  await CacheHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
final navigatorKey=GlobalKey<NavigatorState>();

   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckInternetCubit()..checkInternet(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
    
          // is not restarted.
          primarySwatch: Colors.indigo,
          backgroundColor: AppColor.buttonBackgroundColor,
          scaffoldBackgroundColor:  AppColor.mainColor,
        ),
        home:BlocListener<CheckInternetCubit,CheckInternetState>(
          listener: (context, state) {
              if(state is InternetNotConnectedState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      padding: EdgeInsets.all(20),
                      content:Text(state.message),
                      backgroundColor:Colors.red ,
                    ),
                  );
                }
                else if(state is InternetConnectedState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      padding: EdgeInsets.all(20),
                      content: Text(state.message),
                      backgroundColor:Colors.green ,
                    ),
                  );
                }
          },
          child: FirstScreen(),
        ),
      ),
    );
  }
}


