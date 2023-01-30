import 'package:flutter/material.dart';
import 'package:quran_app/screens/quran/surah/arabic_sura_number.dart';
import 'package:quran_app/shared/component/constains.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/custom_app_bar.dart';
import 'package:quran_app/widget/custom_cart_for_surah.dart';

import 'surah_builder.dart';



class TestScreen extends StatelessWidget {
  final bool isShowImageAndAppBar;
  const TestScreen({Key? key, this.isShowImageAndAppBar=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       floatingActionButton: FloatingActionButton(
        tooltip: 'Go to bookmark',
        child: const Icon(Icons.bookmark),
        backgroundColor: AppColor.iconColor1.withOpacity(.8),
        onPressed: () async {
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
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(child:  Text('Error'));
            } else if (snapshot.hasData) {
              return Column(
                children: [
                 isShowImageAndAppBar==true? CustomAppBar(
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
                  ):Container(),
                 
                  isShowImageAndAppBar==true? Container(
                    height: Dimensions.height150,
                    margin: EdgeInsets.only(left: Dimensions.height20,right: Dimensions.height20),
                    decoration: BoxDecoration(
                      color: AppColor.paraColor.withOpacity(.4),
                      borderRadius: BorderRadius.circular(Dimensions.radius20,),
                      image:const DecorationImage(
                        image: AssetImage("assets/images/sl.png"),
                        fit: BoxFit.fill,
                        opacity: .8,

                      ),
                    ),
                  ):Container(),
               isShowImageAndAppBar==true?  const Divider(endIndent: 40,indent: 40,thickness: 1.5):Container(),
                  Expanded(
                    child: ListView.separated(
                      padding:const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: CustomCardSurah(
                            name: arabicName[index]['nameEN'],
                            arabicName: arabicName[index]['name'],
                            meccaOrmadina: arabicName[index]['name'],
                            number: "${index + 1}",
                            verses: "${noOfVerses[index]} verses",
                          ),
                          onTap: () {

                            fabIsClicked = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SurahBuilder(
                                    arabic: quran[0],
                                    sura: index,
                                    suraName: arabicName[index]['name'],
                                    ayah: 0,
                                  )),
                            );

                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return DetailsScreen(
                            //     englishName: model[index].translatedName.name,
                            //     name: model[index].nameSimple,
                            //     meccOrMad: model[index].revelationPlace,
                            //     verses: model[index].versesCount,
                            //     isBismillah: model[index].bismillahPre,
                            //     numberOfSurah: index,
                            //   );
                            // }));
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>const Divider(
                        thickness: 1.5,
                      ),
                      itemCount: arabicName.length,
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
        ),
    );
  }
  Container indexCreator(quran, context) {
    return Container(
      color: AppColor.mainColor,
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              color: i % 2 == 0
                  ? const Color.fromARGB(255, 253, 247, 230)
                  : const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(
                child: Row(
                  children: [
                    ArabicSuraNumber(index: i),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontFamily: 'quran',
                          shadows: [
                            Shadow(
                              offset: Offset(.5, .5),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 130, 130, 130),
                            )
                          ]),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                          arabic: quran[0],
                          sura: i,
                          suraName: arabicName[i]['name'],
                          ayah: 0,
                        )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}