
import 'package:flutter/material.dart';
import 'package:quran_app/screens/quran/surah/arabic_numbers.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({Key? key,required this.index}) : super(key: key);
    final int index;
  @override
  Widget build(BuildContext context) {
    return Text("\uFD3E"+(index+1).toString().toArabicNumbers+"\uFD3F", style: const TextStyle(
        color: Colors.black,
        fontFamily: 'me_quran',
        fontSize: 20,
        shadows: [
          Shadow(
            offset: Offset(.5, .5),
            blurRadius: 1.0,
            color: Colors.amberAccent,
          ),
        ]),);
  }
}