import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/screens/sebha/sebha_cubit/sebha_cubit.dart';
import 'package:quran_app/screens/sebha/sebha_cubit/sebha_states.dart';
import 'package:quran_app/utills/diminsions.dart';
import 'package:quran_app/widget/custom_app_bar.dart';
import 'package:quran_app/widget/custom_bottom.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SebhaCubit(),
        child: BlocBuilder<SebhaCubit, SebhaStates>(
          builder: (context, state) {
            var cubit = SebhaCubit.get(context);
            bool isSave = false;
            return Column(
              children: [
                CustomAppBar(
                  isDrawer: false,
                  url: "assets/images/arrow.png",
                  imageH: Dimensions.height20,
                  imageW: Dimensions.height20,
                  text: "Sebha",
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  onTap: () {
                    cubit.getCounter("plus");
                  },
                  child: Container(
                    height: Dimensions.height100 * 5,
                    child: Center(
                        child: Text(
                      "${cubit.counter}",
                      style: TextStyle(
                        fontSize: Dimensions.font30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/images/sbha.png"),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomButton(
                        buttonText: "press ",
                        transparent: false,
                        margin: EdgeInsets.only(
                            left: Dimensions.height20,
                            right: Dimensions.height20),
                        onPressed: () {
                          cubit.getCounter("plus");
                        },
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(
                          right: Dimensions.height20,
                          top: Dimensions.height20,
                          bottom: Dimensions.height20),
                      child: CustomButton(
                        buttonText: "clear",
                        onPressed: () {
                          print("clear");
                          cubit.getCounter("clear");
                        },
                      ),
                    )),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
