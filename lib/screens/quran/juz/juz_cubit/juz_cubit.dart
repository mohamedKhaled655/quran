


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/model/juz_model.dart';
import 'package:quran_app/shared/network/remote/dio_helper.dart';

import 'juz_states.dart';

class JuzCubit extends Cubit<JuzStates>{
  JuzCubit() : super(InitialJuzState());

  static JuzCubit get(context)=>BlocProvider.of(context);

  late JuzModel juzModel;
  bool isJuzLoading=false;
  void getJuzData(int num){
    emit(JuzLoadingState());
    DioHelper.getData(url: "https://api.alquran.cloud/v1/juz/$num/quran-uthmani"
    )
    .then((value) {
      juzModel=JuzModel.fromJson(value.data);
      isJuzLoading=true;
      print("juz= "+juzModel.data.ayahs[0].text);
      emit(JuzSuccessState());
    })
    .catchError((e){
      isJuzLoading=false;
      print("juz error = "+e.toString());
      emit(JuzErrorState(message: e.toString()));
    });
  }

}