
abstract class JuzStates{}

class InitialJuzState extends JuzStates{}

class JuzSuccessState extends JuzStates{}
class JuzLoadingState extends JuzStates{}
class JuzErrorState extends JuzStates{
  final String message;

  JuzErrorState({required this.message});
}