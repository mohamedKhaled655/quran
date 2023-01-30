
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/model/chaper_model.dart';
import 'package:quran_app/screens/askar/askar_screen.dart';
import 'package:quran_app/screens/prayer/prayer_screen.dart';
import 'package:quran_app/shared/network/remote/dio_helper.dart';
import 'package:quran_app/utills/errors/failure%20.dart';

import '../home_screen.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(InitailHomeState());

  static HomeCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;



  List<Widget>bottomScreen=[
   const HomeScreen(),
   PrayerScreen(),
   const AskarScreen(ispressArrowBack: false),
  ];
  void changeBottom(int index)
  {
  
    currentIndex=index;
    emit(HomeChangeBottomNav());
  }
  
  late  ChaptersModel chaptersModel;
  bool isChapter=false;
  
  void getChapters(){
    emit(ChapterLoadingState());
    DioHelper.getData(
      url: "https://api.quran.com/api/v4/chapters?language=en",
    ).then((value) {
      
      chaptersModel=ChaptersModel.fromJson(value.data);
      isChapter=true;
      print("val="+chaptersModel.chapters[0].nameArabic);
      emit(ChapterSuccessState());
    }).catchError((e){
      isChapter=false;
      print("error= "+e.toString());
      
      emit(ChapterErrorState(message: ServiceFailure.fromDioError(e).errorMessage));
    });
  }
/*
  Future<ChaptersModel>getChaptersData()async{
    final response=await Dio().get("https://api.quran.com/api/v4/chapters");
   if(response.statusCode==200){
     return ChaptersModel.fromJson(response.data);
   }
   else{
     throw Exception(response.data);
   }
  }
  void getChapters()async{
    emit(ChapterLoadingState());
    try{
    emit(ChapterSuccessState());
    final result=await getChaptersData();
    isChapter=true;
    print("result= "+result.chapters![0].id.toString()); 
    }catch (e){
      isChapter=false;
      print("error= "+e.toString());
      emit(ChapterErrorState(message: e.toString()));
    }
  }
*/





}