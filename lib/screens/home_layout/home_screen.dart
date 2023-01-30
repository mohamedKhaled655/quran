import 'package:flutter/material.dart';
import 'package:quran_app/shared/component/constains.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/custom_app_bar.dart';
import 'package:quran_app/widget/custom_tab_bar.dart';
import 'package:quran_app/widget/small_text.dart';

import '../../widget/custom_card.dart';
import '../search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          searchOnPress: () {
            showSearch(context: context, delegate: DataSearch(arabicName: arabicName));
          },
        ),
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.height20, top: Dimensions.height20),
          child: SmallText(
              text: " Asalamu Alaikum !!!",
              color: AppColor.textColor,
              size: Dimensions.font15 + 1),
        ),

        CustomCard(
          title:  "${arabicName[bookmarkedSura - 1]['name']}",
          numberOfAyah: "Ayah no. $bookmarkedAyah",
        ),

        const CustomTabBar(),
      ],
    );
  }
}





