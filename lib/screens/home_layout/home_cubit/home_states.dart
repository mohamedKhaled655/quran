
abstract class HomeStates{}
class InitailHomeState extends HomeStates{}
class HomeChangeBottomNav extends HomeStates{}

class ChapterSuccessState extends HomeStates{}
class ChapterLoadingState extends HomeStates{}
class ChapterErrorState extends HomeStates{
  final String message;

  ChapterErrorState({required this.message});
}



