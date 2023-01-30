import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/screens/quran/surah/custom_build_surah.dart';
import 'package:quran_app/screens/quran/surah/surah_cubit/surah_cubit.dart';
import 'package:quran_app/screens/quran/surah/surah_cubit/surah_states.dart';
import 'package:quran_app/shared/component/constains.dart';

import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/big_text.dart';
import 'package:quran_app/widget/custom_app_bar.dart';
import 'package:quran_app/widget/custom_loader.dart';

import 'audio_file.dart';
import 'search_screen.dart';

class DetailsScreen extends StatelessWidget {
  final name, englishName, meccOrMad, verses;
  final bool isBismillah;
  final int numberOfSurah;
  const DetailsScreen(
      {Key? key,
      required this.name,
      required this.englishName,
      required this.meccOrMad,
      required this.verses,
      required this.isBismillah,
      required this.numberOfSurah})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            searchOnPress: () {
              showSearch(context: context, delegate: DataSearch(arabicName: arabicName));
            },
            isDrawer: false,
            url: "assets/images/arrow.png",
            imageH: 22,
            onPress: () {
              print("arrow backed");
              Navigator.pop(context);
            },
          ),
          Container(
            height: Dimensions.height200 + Dimensions.height100 / 2,
            width: double.maxFinite,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              image: const DecorationImage(
                image: AssetImage("assets/images/ss.png"),
                opacity: .3,
              ),
              gradient: LinearGradient(
                colors: [
                  AppColor.paraColor.withOpacity(.3),
                  AppColor.paraColor.withOpacity(.4),
                  AppColor.paraColor.withOpacity(.4),
                  AppColor.paraColor.withOpacity(.4),
                  AppColor.paraColor.withOpacity(.4),
                  AppColor.paraColor.withOpacity(.5),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: name,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.bold,
                  size: 25,
                ),
                BigText(
                    text: englishName,
                    color: Colors.white,
                    size: Dimensions.font15 + 1),
                Divider(
                    color: Colors.white,
                    endIndent: Dimensions.height150 / 3,
                    indent: Dimensions.height100 / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: BigText(
                          text: meccOrMad,
                          color: Colors.white,
                          size: Dimensions.font15 + 1),
                    ),
                    Container(
                      height: Dimensions.height10 / 2,
                      width: Dimensions.height10 / 2,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height150 / 3),
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: BigText(
                          text: "${verses} verses",
                          color: Colors.white,
                          size: Dimensions.font15 + 1),
                    ),
                  ],
                ),
                (isBismillah == true)
                    ? Container(
                        height: Dimensions.height100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/iii.png"),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          BlocProvider(
            create: (context) => SurahCubit()
              ..getSurah(numberOfSurah + 1)
              ..getTranSurah(numberOfSurah + 1)
              ..getAudio(numberOfSurah + 1),
            child: BlocBuilder<SurahCubit, SurahStates>(
              builder: (context, state) {
                var cubit = SurahCubit.get(context);
                if (cubit.surahIsLoading == true) {
                  return Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        AudioPlayer advancedPlayer = AudioPlayer();
                        return Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Dimensions.height150 / 3 + 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  color: AppColor.paraColor.withOpacity(.3),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: CircleAvatar(
                                        child: Text(
                                            "${cubit.surahModel.verses[index].verseKey}"),
                                        backgroundColor:
                                            AppColor.iconColor1.withOpacity(.9),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.share,
                                              size: Dimensions.font30,
                                              color: AppColor.iconColor1),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              if (cubit.isAudioLoading ==
                                                  true) {
                                                return AudioFile(
                                                  advancedPlayer:
                                                      advancedPlayer,
                                                  audioModel: cubit.audioModel,
                                                  index: numberOfSurah + 1,
                                                );
                                              } else if (state
                                                  is AudioLoadingState) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else {
                                                if (state is AudioErrorState) {
                                                  return Scaffold(
                                                    body: Container(
                                                      padding:const
                                                          EdgeInsets.all(20),
                                                      color: AppColor.mainColor,
                                                      child: Center(
                                                        child: Text(
                                                          state.message,
                                                          maxLines: 4,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return Container(
                                                  color: AppColor.mainColor,
                                                  child:const Text("error Audio"),
                                                );
                                              }
                                            }));
                                          },
                                          icon: Icon(Icons.play_arrow,
                                              size: Dimensions.font30 + 5,
                                              color: AppColor.iconColor1),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return CustomBuildSurah(
                                                arabic: quran[0],
                                                sura: index,
                                                suraName: arabicName[index]['name'],
                                                ayah: 0,
                                              );
                                            }));
                                          },
                                          icon: Icon(
                                              Icons.auto_stories_outlined,
                                              size: Dimensions.font30 + 5,
                                              color: AppColor.iconColor1),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  // Expanded(child: Container(),),
                                  Expanded(
                                    child: Text(
                                      cubit
                                          .surahModel.verses[index].textIndopak,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.textColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                (cubit.tranIsLoading == true)
                                    ? cubit
                                        .tranSurahModel.translations[index].text
                                    : "loading",
                                style: TextStyle(
                                    fontSize: 20, color: AppColor.textColor),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.surahModel.verses.length,
                    ),
                  );
                }

                else if (state is SurahErrorState) {
                  return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          state.message,
                        ),
                      ));
                } else if (state is TranSurahErrorState) {
                  return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          state.message,
                        ),
                      ));
                }

                else {

                  return const CustomLoader();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
