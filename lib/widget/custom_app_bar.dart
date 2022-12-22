import 'package:flutter/material.dart';

import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';

import 'big_text.dart';

class CustomAppBar extends StatelessWidget {
  final String url, text;
  final VoidCallback? searchOnPress;
  final VoidCallback? onPress;
  final bool isDrawer;
  final double imageH, imageW;
  const CustomAppBar(
      {Key? key,
      this.url = "assets/images/drawer.png",
      this.text = "Quran App",
      this.searchOnPress,
      this.onPress,
      this.isDrawer = true,
      this.imageH = 15,
      this.imageW = 34,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.height10,
          ),
          Container(
            padding: EdgeInsets.only(left: Dimensions.height10),
            height: Dimensions.height100 - 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (isDrawer == true)
                    ? Builder(
                        builder: (context) => IconButton(
                          icon: Image.asset(
                            url,
                            height: imageH,
                            width: imageW,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      )
                    : IconButton(
                        icon: Image.asset(
                          url,
                          height: imageH,
                          width: imageW,
                        ),
                        onPressed:onPress,
                      ),
                SizedBox(
                  width: 10,
                ),
                BigText(
                  text: text,
                  color: AppColor.textColor,
                  size: Dimensions.height25,
                  fontWeight: FontWeight.bold,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: searchOnPress,
                    child: Container(
                      height: Dimensions.height30,
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: AppColor.paraColor.withOpacity(.4),
                        border: Border.all(
                          color: AppColor.paraColor.withOpacity(.5),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.search),
                           
                            /*
                            BlocBuilder<HomeCubit,HomeStates>(
                              builder: (context, state) {
                                var cubit = HomeCubit.get(context);
    
                                    if(cubit.isChapter==true){
                                      return  GestureDetector(
                                child: Icon(Icons.search),
                                onTap: (){
                                  showSearch(context: context, delegate:DataSearch( cubit.chaptersModel.chapters) );
                                },
                                );
                                    }
                                    else if(state is ChapterLoadingState){return CircularProgressIndicator();}
                                    else{
                                      return Scaffold(appBar: AppBar(),);
                                    }
                                
                              },
                            ),*/
                            
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
