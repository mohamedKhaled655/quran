import 'package:flutter/material.dart';
import 'package:quran_app/utills/diminsions.dart';

import '../utills/colors.dart';

class CustomAyat extends StatelessWidget {
  const CustomAyat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return  Expanded(
          child: Container(
          height: Dimensions.height150+20,
          margin: EdgeInsets.only(left: Dimensions.height20,right: Dimensions.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.height150/3+10,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: AppColor.paraColor.withOpacity(.3),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        child: Text("1"),
                        backgroundColor: AppColor.iconColor1.withOpacity(.9),
                        

                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                         icon: Icon(Icons.share,size: Dimensions.font30,color: AppColor.iconColor1),
                         ),
                          IconButton(
                          onPressed: (){},
                         icon: Icon(Icons.play_arrow,size: Dimensions.font30+5,color: AppColor.iconColor1),
                         ),
                         IconButton(
                          onPressed: (){},
                         icon: Icon(Icons.auto_stories_outlined,size: Dimensions.font30+5,color: AppColor.iconColor1),
                         ),
                         SizedBox(width: 10,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              Row(
                children: [
                  Spacer(),
                  Text("ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَـٰلَمِينَ",textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20,color: AppColor.textColor), ),
                ],
              ),

              Text("[All] praise is [due] to Allah, Lord of the worlds -",
              style: TextStyle(fontSize: 20,color: AppColor.textColor),),
            ],
          ),
        ),);
        },
        separatorBuilder: (context,index)=>Divider(), 
        itemCount: 5,
        );
  }
}