

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
   Color ?color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;

   BigText({Key? key,this.overflow=TextOverflow.visible,this.size=20,
     this.color=const Color(0xFF332d2b),required this.text,this.fontWeight=FontWeight.w400})
       : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
