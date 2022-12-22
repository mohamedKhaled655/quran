import 'package:flutter/material.dart';
import 'package:quran_app/model/chaper_model.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/custom_app_bar.dart';
import 'package:quran_app/widget/custom_cart_for_surah.dart';

import 'details_screen.dart';

class SurahScreen extends StatelessWidget {
  final ChaptersModel chaptersModel;

  const SurahScreen({Key? key, required this.chaptersModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = chaptersModel.chapters;
    return Scaffold(
      
      body:Column(
        children: [
          CustomAppBar(
            isDrawer: false,
            text: "Surah      ",
            url: "assets/images/arrow.png",
            imageH: 25,
            imageW: 25,
            onPress: (){
              Navigator.of(context).pop();
            },
            searchOnPress: (){

            },
          ),
          Container(
            height: Dimensions.height150,
            margin: EdgeInsets.only(left: Dimensions.height20,right: Dimensions.height20),
            decoration: BoxDecoration(
              color: AppColor.paraColor.withOpacity(.4),
              borderRadius: BorderRadius.circular(Dimensions.radius20,),
              image: DecorationImage(
                image: AssetImage("assets/images/sl.png"),
                fit: BoxFit.fill,
                opacity: .8,

              ),
            ),
          ),
          Divider(endIndent: 40,indent: 40,thickness: 1.5),
         Expanded(
           child: ListView.separated(
            padding: EdgeInsets.all(0),
                 itemBuilder: (context, index) {
            return GestureDetector(
              child: CustomCardSurah(
                name: model[index].nameSimple,
                arabicName: model[index].nameArabic,
                meccaOrmadina: model[index].revelationPlace,
                number: "${model[index].id}",
                verses: "${model[index].versesCount} verses",
              ),
              onTap: () {
                
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsScreen(
                    englishName: model[index].translatedName.name,
                    name: model[index].nameSimple,
                    meccOrMad: model[index].revelationPlace,
                    verses: model[index].versesCount,
                    isBismillah: model[index].bismillahPre,
                    numberOfSurah: index,
                  );
                }));
              },
            );
                 },
                 separatorBuilder: (context, index) => Divider(
            thickness: 1.5,
                 ),
                 itemCount: model.length,
               ),
         ),
        ],
      ),
    );
  }
}
