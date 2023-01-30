import 'package:flutter/material.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/utills/diminsions.dart';

import 'big_text.dart';

class CustomCardSurah extends StatelessWidget {
  final String url, number, name, verses, meccaOrmadina, arabicName;

  const CustomCardSurah(
      {Key? key,
      this.url = "assets/images/tr.png",
      required this.number,
      required this.name,
      required this.verses,
      required this.meccaOrmadina,
      required this.arabicName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        image: DecorationImage(image: AssetImage("assets/images/ss.png"), alignment:Alignment.bottomRight,opacity: .5 ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(
                  left: Dimensions.height20, right: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(url), fit: BoxFit.fitHeight),
              ),
              child: Center(
                  child: Text(
                number,
                style: TextStyle(color: Colors.black),
              )),
            ),
            SizedBox(
              width: Dimensions.height15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimensions.height10*11,
                  child: Text(
                     name,
                    style: TextStyle(
                      color: AppColor.iconColor1,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: BigText(
                        text: meccaOrmadina,
                        size: Dimensions.height10 + 2,
                      ),
                    ),
                    Container(
                      height: Dimensions.height10 / 2,
                      width: Dimensions.height10 / 2,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height150 / 3),
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: BigText(
                        text: verses,
                        size: Dimensions.height10 + 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            // BigText(
            //   text: arabicName,
            //   color: AppColor.iconColor2,
            //   size: Dimensions.font20 + 5,
            // ),
            Text(
              "    $arabicName",
              style:  TextStyle(
                  fontSize: 30,
                  color: AppColor.iconColor2,
                  fontFamily: 'quran',
                  shadows:const [
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
      ),
    );
  }
}
