import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/big_text.dart';
import 'package:quran_app/widget/custom_app_bar.dart';
import 'package:quran_app/widget/custom_tab_bar.dart';
import 'package:quran_app/widget/small_text.dart';

import '../../widget/custom_card.dart';
import '../search_screen.dart';
import 'home_cubit/home_cubit.dart';
import 'home_cubit/home_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  searchOnPress: (){
                    showSearch(context: context, delegate:DataSearch(chapter: []) );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.height20, top: Dimensions.height20),
                  child: SmallText(
                      text: "Asalamu Alaikum !!!",
                      color: AppColor.textColor,
                      size: Dimensions.font15 + 1),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.height20, top: Dimensions.height15 / 3),
                  child: BigText(
                      text: "Mohamed Khaled",
                      color: AppColor.textColor,
                      fontWeight: FontWeight.bold),
                ),
                CustomCard(
                  title: "Al-Fatiah",
                  numberOfAyah: "Ayah no. 1",
                ),
                BlocBuilder<HomeCubit, HomeStates>(
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    if (cubit.isChapter == true) {
                      print("home succ = "+cubit.chaptersModel.chapters[0].nameArabic);
                      return CustomTabBar(
                        chaptersModel: cubit.chaptersModel,
                      );
                    } else if (state is ChapterErrorState) {
                      return Expanded(child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(state.message,),
                      ));
                    } else if (state is ChapterLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return CustomTabBar(chaptersModel: cubit.chaptersModel);
                    }
                   
                  },
                ),
              ],
            );
  }
}