
import 'package:flutter/material.dart';
import 'package:quran_app/screens/quran/surah/surah_builder.dart';
import 'package:quran_app/shared/component/constains.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/small_text.dart';

import 'big_text.dart';

class CustomCard extends StatefulWidget {
  final String title,numberOfAyah;

  const CustomCard({Key? key,required this.title,required this.numberOfAyah}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  @override
  void initState() {
    WidgetsBinding
        .instance
        ?.addPostFrameCallback(

            (_) async{
      await readJson();
      await getSettings();

      setState(() {
        widget.title;
        widget.numberOfAyah;
      });
    }



    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
            fabIsClicked = true;
            if (await readBookmark() == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SurahBuilder(
                            arabic: quran[0],
                            sura: bookmarkedSura - 1,
                            suraName: arabicName[bookmarkedSura - 1]['name'],
                            ayah: bookmarkedAyah,
                          )));
            }
          },
      child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.height20, top: Dimensions.height10,),
              height: Dimensions.height100+30,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.paraColor.withOpacity(.4),
                border: Border.all(
                  color: AppColor.paraColor.withOpacity(.5),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/v2.png"),
                          SizedBox(width: Dimensions.height10,),
                          SmallText(text: "Last Read",color: AppColor.iconColor1,size: Dimensions.font15+1,),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10,),
                      BigText(text: widget.title,color: AppColor.iconColor1,fontWeight: FontWeight.bold,),
                      SizedBox(width: Dimensions.height10,),
                      SmallText(text: widget.numberOfAyah,color: AppColor.iconColor1,),
                    ],
                  ),
                  Expanded(child: Text(""),),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("assets/images/v1.png",fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
    );
  }
}