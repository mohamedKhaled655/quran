import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/model/chaper_model.dart';
import 'package:quran_app/screens/details_screen.dart';
import 'package:quran_app/screens/quran/juz/juz_screen.dart';
import 'package:quran_app/screens/quran/surah/test.dart';
import 'package:quran_app/screens/surah_screen.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/big_text.dart';
import 'package:quran_app/widget/small_text.dart';

import '../screens/home_layout/home_cubit/home_cubit.dart';
import '../screens/home_layout/home_cubit/home_states.dart';
import 'custom_bottom.dart';

class CustomTabBar extends StatefulWidget {
  //final ChaptersModel chaptersModel;

  const CustomTabBar({
    Key? key,
    //required this.chaptersModel
  }) : super(
          key: key,
        );

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //tab bar
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelPadding:const EdgeInsets.only(left: 20, right: 20),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:
                  CircleTabIndicator(color: AppColor.textColor, radius: 4),
              tabs: const [
                Tab(
                  text: "Surah Offline",
                ),
               // Tab(text: "juz", ),
                Tab(
                  text: "Surah online ",
                ),
              ],
            ),
          ),
        ),
        Container(
          height: Dimensions.height350 + Dimensions.height30 * 2,
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20),
          child: TabBarView(
            controller: _tabController,
            children: [
              const TestScreen(isShowImageAndAppBar: false),

             // const JuzScreen(),
              

              //Surah online
              BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  var cubit = HomeCubit.get(context);

                  if (cubit.isChapter == true) {
                    List<Chapters> model = cubit.chaptersModel.chapters;
                    return ListView.separated(
                      itemBuilder: (context, iindex) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailsScreen(
                                englishName: model[iindex].translatedName.name,
                                name: model[iindex].nameSimple,
                                meccOrMad: model[iindex].revelationPlace,
                                verses: model[iindex].versesCount,
                                isBismillah: model[iindex].bismillahPre,
                                numberOfSurah: iindex,
                              );
                            }));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/ss.png"),
                                  alignment: Alignment.bottomRight,
                                  opacity: .3),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BigText(
                                            text: model[iindex].nameArabic,
                                            fontWeight: FontWeight.bold,
                                            size: 26,
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          SmallText(
                                              text:
                                                  "Verse  ${model[iindex].versesCount}",
                                              color: AppColor.textColor),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          SmallText(
                                            text: model[iindex].nameSimple,
                                            color: AppColor.textColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox.square(
                                        child: BigText(
                                          text: model[iindex].nameArabic,
                                          fontWeight: FontWeight.bold,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (iindex == 9)
                                  Container(
                                    child: Column(
                                      children: [
                                        const Divider(thickness: 1.5),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: CustomButton(
                                            buttonText: "See More",
                                            radius: 15,
                                            icon: Icons.arrow_forward_ios,
                                            onPressed: () {
                                              if (cubit.isChapter == true) {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return SurahScreen(
                                                    chaptersModel:
                                                        cubit.chaptersModel,
                                                  );
                                                }));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(thickness: 2),
                      itemCount: 10,
                    );
                  } else if (state is ChapterErrorState) {
                    return Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          state.message,
                        ),
                      ),
                    ));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
