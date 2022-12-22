

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quran_app/model/prayer_times_model.dart';
import 'package:quran_app/shared/network/remote/dio_helper.dart';
import 'package:quran_app/shared/services/services_location.dart';

import 'prayer_states.dart';

class PrayerCubit extends Cubit<PrayerStates>{
  PrayerCubit() : super(InitailPrayerState());

  static PrayerCubit get(context)=>BlocProvider.of(context);



  DateTime currentDate = DateTime.now();
  DateTime firstData = DateTime(
    1999,
  );
  DateTime sectData = DateTime(
    2033,
  );
  
  ServicesLocation servicesLocation = ServicesLocation();
  
  double lat = 0;
  double lang = 0;

  void getLoc(BuildContext context) async {
    emit(ServicesLocationLoadingState());
   await servicesLocation.getPostion(context);
    
    Position currentLocation = await servicesLocation.getLatAndLang();
   if(currentLocation.latitude!=0){
    lat=currentLocation.latitude;
    lang=currentLocation.longitude;
    emit(ServicesLocationSuccessState());
   }
  }



  late PrayerTimesModel prayerTimesModel;
  bool isPrayer=false;
  void getTimingPrayer({required double lat,required double long,required int day,required var month,required var year}){
    emit(PrayerLoadingState());
    DioHelper.getData(url: "https://api.aladhan.com/v1/calendar?latitude=$lat&longitude=$long&method=2&month=$month&year=$year")
    .then((value) {
      prayerTimesModel=PrayerTimesModel.fromJson(value.data);
      isPrayer=true;
      print("prayerTimesModel= "+prayerTimesModel.data[0].date.gregorian.day);
      
      emit(PrayerSuccessState());
    })
    .catchError((e){
      isPrayer=false;
      print("pr= "+e.toString());
      emit(PrayerErrorState(message: e.toString())); 
    });
  }


  
}