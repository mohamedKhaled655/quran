
import 'package:flutter/material.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/big_text.dart';
import 'package:quran_app/widget/custom_bottom.dart';
import 'package:quran_app/widget/small_text.dart';



class CheckScreen extends StatelessWidget {
  final String firstTitle,secTitle,url,buttonTitle;
 
  final Widget navTo;

  const CheckScreen({Key? key,required this.firstTitle,
  required this.secTitle,
   
  required this.url,required this.buttonTitle,required this.navTo,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
       
        children: [
          SizedBox(height: Dimensions.height100,),
          Center(child: BigText(text: firstTitle,color: AppColor.textColor,size: Dimensions.font30,)),
          SizedBox(height: Dimensions.height10*2,),
          Center(
            child: Text(secTitle,maxLines: 4,overflow:TextOverflow.ellipsis ),
          ),
          Container(
            height: Dimensions.height300*2,
            child: Stack(
              children: [
               /* Align(

                  child: Image.asset("assets/images/rec.png"),
                ),*/
                Positioned(
                  left: Dimensions.height25*2,
                  top: Dimensions.height150,
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Image.asset(url, )),
                ),
                Positioned(
                  left: Dimensions.height120,
                  top: Dimensions.height200*2+Dimensions.height100-10,
                  child: CustomButton(
                    buttonText:buttonTitle,
                    radius: Dimensions.radius20-2,
                    width: Dimensions.height200-30,
                   
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context){
                          return navTo;
                        }));
                    },
                    ),
                  ),
              ],
            ),
          ),
          
      ],
      ),
    );
  }
}