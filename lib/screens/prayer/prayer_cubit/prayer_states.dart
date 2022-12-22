abstract class PrayerStates{}
class InitailPrayerState extends PrayerStates{}

class PrayerSuccessState extends PrayerStates{}
class PrayerLoadingState extends PrayerStates{}
class PrayerErrorState extends PrayerStates{
  final String message;

  PrayerErrorState({required this.message});
}



class ServicesLocationSuccessState extends PrayerStates{}
class ServicesLocationLoadingState extends PrayerStates{}