import 'package:flutter/material.dart';
import 'package:quran_app/screens/askar/askar_night_screen.dart';

import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/custom_app_bar.dart';

import 'ad3ya_from_quraan.dart';
import 'ad3ya_sunnah.dart';
import 'elroqya.dart';



class AdayaScreen extends StatefulWidget {
  const AdayaScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<AdayaScreen> createState() => _AdayaScreenState();
}

class _AdayaScreenState extends State<AdayaScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            isDrawer: false,
            url: "assets/images/arrow.png",
            imageH: Dimensions.height20,
            imageW: Dimensions.height20,
            text: "Adaya     ",
            onPress: () {
              Navigator.of(context).pop();
            },
          ),
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
                    text: "Ad3ya from Quraan",
                  ),
                  Tab(
                    text: "Ad3ya from Sunnah",
                  ),
                  Tab(
                    text: "Elroqya",
                  ),
                 
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              //height: Dimensions.screenHeight - Dimensions.height300 + 50,
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 20),
              child: TabBarView(
                controller: _tabController,
                children: [
                 AdayaQuraan(),
                 /////
                 AdayaSunnah(),
                 ////
               Elroqya(),
                  //////
                
                
                ],
              ),
            ),
          ),
        ],
      ),
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
