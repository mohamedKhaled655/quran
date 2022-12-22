import 'package:flutter/material.dart';
import 'package:quran_app/model/chaper_model.dart';
import 'package:quran_app/screens/details_screen.dart';
import 'package:quran_app/screens/quran/juz/juz_screen.dart';
import 'package:quran_app/screens/surah_screen.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/big_text.dart';
import 'package:quran_app/widget/small_text.dart';

import 'custom_bottom.dart';

class CustomTabBar extends StatefulWidget {
  final ChaptersModel chaptersModel;

  const CustomTabBar({Key? key, required this.chaptersModel})
      : super(
          key: key,
        );

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    List<Chapters> model = widget.chaptersModel.chapters;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //tab bar
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelPadding: EdgeInsets.only(left: 20, right: 20),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:
                  CircleTabIndicator(color: AppColor.textColor, radius: 4),
              tabs: [
                Tab(
                  text: "Surah",
                ),
                Tab(
                  text: "juz",
                ),
                Tab(
                  text: "Page",
                ),
              ],
            ),
          ),
        ),
        Container(
          height: Dimensions.height350 + Dimensions.height30 - 10,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 20),
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.separated(
                itemBuilder: (context, iindex) {
                  return GestureDetector(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                      decoration: BoxDecoration(
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Divider(thickness: 1.5),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15),
                                    child: CustomButton(
                                      buttonText: "See More",
                                      radius: 15,
                                      icon: Icons.arrow_forward_ios,
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                          return SurahScreen(
                                            chaptersModel: widget.chaptersModel,
                                          );
                                        }));
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
                separatorBuilder: (context, index) => Divider(thickness: 2),
                itemCount: 10,
              ),
              JuzScreen(),
              ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/images/Quran App.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal,
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
