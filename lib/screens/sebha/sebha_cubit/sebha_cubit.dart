import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/screens/sebha/sebha_cubit/sebha_states.dart';
import 'package:quran_app/shared/network/local/cache_Helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaCubit extends Cubit<SebhaStates>{
  SebhaCubit() : super(InitailSebhaState());

  static SebhaCubit get(context)=>BlocProvider.of(context);

  int counter=0;

  void getCounter(String key){
    if(key=="plus"){
      counter+=1;
    }
    else if(key=="minus"){
      if(counter>0){
        counter-=1;
      } 
    }
    else if(key=="clear"){       
        counter=0;
        CacheHelper.removeData(key: "save").then((value) {
          print("removed="+value.toString());
        });
        
      }
    
    emit(SebhaCountState());
  }


  void saveData(){
   // CacheHelper.sharedPreferences.setInt("save", counter);
    CacheHelper.saveData(key: "save", value: counter).then((value) {
      print(" save== "+value.toString());
    });
    print("save= "+CacheHelper.saveData(key: "save", value: counter).toString());
  }
  int getData(){
    
    return CacheHelper.getDta(key: "save");
  }


}