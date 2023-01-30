import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/model/audio_model.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/model/tran_surah_model.dart';
import 'package:quran_app/screens/quran/surah/surah_cubit/surah_states.dart';
import 'package:quran_app/shared/network/remote/dio_helper.dart';
import 'package:quran_app/utills/errors/failure%20.dart';


class SurahCubit extends Cubit<SurahStates>{
  SurahCubit() : super(InitialSurahState());

  static SurahCubit get(context)=>BlocProvider.of(context);

 late SurahModel surahModel;
 bool surahIsLoading=false;
  void getSurah(int index){
  emit(SurahLoadingState());
  DioHelper.getData(url: "https://api.quran.com/api/v4/quran/verses/indopak?chapter_number=$index",
  ).then((value) {
    emit(SurahSuccessState());
     surahModel= SurahModel.fromJson(value.data);
     surahIsLoading=true;
    print("surah= "+surahModel.verses[0].verseKey);
  })
  .catchError((e){
    print("error ="+e.toString());
    surahIsLoading=false;
    emit(SurahErrorState(message: ServiceFailure.fromDioError(e).errorMessage));
  });
}

late TranSurahModel tranSurahModel;
 bool tranIsLoading=false;
  void getTranSurah(int index){
  emit(TranSurahLoadingState());
  DioHelper.getData(url: "https://api.quran.com/api/v4/quran/translations/131?chapter_number=$index",
  ).then((value) {
    emit(TranSurahSuccessState());

     tranSurahModel= TranSurahModel.fromJson(value.data);
     tranIsLoading=true;
    print("surah= "+tranSurahModel.translations[0].text);
  })
  .catchError((e){
    print("error ="+e.toString());
    tranIsLoading=false;
    emit(TranSurahErrorState(message: ServiceFailure.fromDioError(e).errorMessage));
  });
}

late AudioModel audioModel;
bool isAudioLoading=false;
void getAudio(int index){
  emit(AudioLoadingState());
  DioHelper.getData(url: "https://api.quran.com/api/v4/chapter_recitations/3/$index",
  ).then((value) {
    emit(AudioSuccessState());

     audioModel= AudioModel.fromJson(value.data);
     isAudioLoading=true;
    print("audio= "+audioModel.audioFile.audioUrl);
  })
  .catchError((e){
    print("error ="+e.toString());
    isAudioLoading=false;
    emit(AudioErrorState(message: ServiceFailure.fromDioError(e).errorMessage));
  });
}


}
