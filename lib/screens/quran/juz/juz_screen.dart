import 'package:flutter/material.dart';
import 'package:quran_app/shared/component/constains.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/widget/big_text.dart';

import 'custom_juz_builder.dart';
import 'juz_body_screen.dart';


class JuzScreen extends StatelessWidget {
  const JuzScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(right: 10) ,
      color: AppColor.mainColor,
      child: GridView.count(
        
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(8.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children:List.generate(30, (index) =>  GestureDetector(
            onTap: (){
              
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CustomBuildJuz(
                arabic: quran[0],
                sura: index,
                suraName: arabicName[index]['name'],
                ayah: 0,
              );
              }));
            },
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white10,
              ),
              child: Center(child: BigText(text: "${index+1}",)),
            ),
          )),

          ),
    );
  }
}