import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/screens/quran/juz/juz_cubit/juz_cubit.dart';
import 'package:quran_app/screens/quran/juz/juz_cubit/juz_states.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/big_text.dart';

class JuzBodyScreen extends StatelessWidget {
  final int num;
  const JuzBodyScreen({Key? key,required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JuzCubit()..getJuzData(num+1),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill,
              opacity: .6,
            ),
          ),
          child: BlocBuilder<JuzCubit,JuzStates>(
            builder: (context, state) {
              var cubit = JuzCubit.get(context);
            
              if(cubit.isJuzLoading==true){
                  int x=cubit.juzModel.data.ayahs.length;
                return SingleChildScrollView(
                  child: SafeArea(
                              child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.height20,
                        right: Dimensions.height20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                          BigText(
                            text: cubit.juzModel.data.number.toString(),
                            size: 30,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 50,
                      indent: 50,
                      thickness: 1,
                    ),
                  
                     Center(
                        child: BigText(
                      text:cubit.juzModel.data.ayahs[0].surah.name,
                      size: 50,
                    )),
                    Divider(
                      color: Colors.black,
                      endIndent: 50,
                      indent: 50,
                      thickness: 1.5,
                    ),
                    BigText(
                      text: (cubit.juzModel.data.ayahs[0].text== "﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")?cubit.juzModel.data.ayahs[0].text:"",
                      size: 25,
                    ),
                    
                      Container(
                      margin: EdgeInsets.all(20),
                      alignment: Alignment.bottomRight,
                      child: RichText(
                        textDirection: TextDirection.rtl,
                              
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                           
                              TextSpan(
                                text: cubit.juzModel.data.ayahs[0].text+"(${cubit.juzModel.data.ayahs[0].numberInSurah})",
                            ),
                           WidgetSpan(
                            child: Container(
                              child: CircleAvatar(
                                child: Text("1"),
                                radius: 10,
                              ),
                           ),
                           ),
                            
                            
                            
                          ],
                        ),
                      ),
                              
                    ),
                    
                    
                  ],
                              ),
                            ),
                );
              }
              else if(state is JuzLoadingState){
                return Center(child: CircularProgressIndicator());
              }
              else {
                if(state is JuzErrorState)
                return Container(
                  child: Center(child: Text(state.message,maxLines: 5,)),
                );
                return Container();
              }
              
            },
          ),
        ),
      ),
    );
  }
}
