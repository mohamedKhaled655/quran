import 'package:flutter/material.dart';
import 'package:quran_app/screens/askar/askar_night_screen.dart';

import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/custom_app_bar.dart';

import 'askar_morning_screen.dart';
import 'sleeping_screen.dart';
import 'praying_askar_screen.dart';

class AskarScreen extends StatefulWidget {
  final bool ispressArrowBack;
  const AskarScreen({
    Key? key, this.ispressArrowBack=true,
  }) : super(
          key: key,
        );

  @override
  State<AskarScreen> createState() => _AskarScreenState();
}

class _AskarScreenState extends State<AskarScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            isDrawer: false,
            url:(widget.ispressArrowBack==false)?"assets/images/azkar.png": "assets/images/arrow.png",
            imageH:(widget.ispressArrowBack==false)?Dimensions.height20*2: Dimensions.height20,
            imageW: (widget.ispressArrowBack==false)?Dimensions.height20*2: Dimensions.height20,
            text: "AZKAR           ",
            onPress: () {
              if(widget.ispressArrowBack==true)
              {
                Navigator.of(context).pop();
              }
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
                    text: "Morning",
                  ),
                  Tab(
                    text: " El Night",
                  ),
                  Tab(
                    text: "Praying Azkar",
                  ),
                  Tab(
                    text: "Sleeping Azkar",
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
                children: const[
                  MorningScreen(),
                 /////
                 AskarNightScreen(),
                 ////
                PrayingAskarScreen(),
                  //////
                SleepingAskarScreen(),
                
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
