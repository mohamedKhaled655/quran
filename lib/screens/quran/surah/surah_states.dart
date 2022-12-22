import 'package:quran_app/model/surah_model.dart';

abstract class SurahStates{}
class InitialSurahState extends SurahStates{}
class SurahSuccessState extends SurahStates{}
class SurahLoadingState extends SurahStates{}
class SurahErrorState extends SurahStates{
  final String message;

  SurahErrorState({required this.message});
}


class TranSurahSuccessState extends SurahStates{}
class TranSurahLoadingState extends SurahStates{}
class TranSurahErrorState extends SurahStates{
  final String message;

  TranSurahErrorState({required this.message});
}


class AudioSuccessState extends SurahStates{}
class AudioLoadingState extends SurahStates{}
class AudioErrorState extends SurahStates{
  final String message;

  AudioErrorState({required this.message});
}