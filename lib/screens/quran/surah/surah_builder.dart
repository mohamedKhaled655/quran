import 'package:flutter/material.dart';
import 'package:quran_app/shared/component/constains.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SurahBuilder extends StatefulWidget {
  final sura;//number of surah
  final arabic;//List of arabic ayat
  final suraName;//name of surah
  int ayah;

  SurahBuilder(
      {Key? key, this.sura, this.arabic, this.suraName, required this.ayah})
      : super(key: key);

  @override
  _SurahBuilderState createState() => _SurahBuilderState();
}
class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => jumbToAyah());
    super.initState();
  }
  

  jumbToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic);
    }
    fabIsClicked = false;
  }

  

  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Padding(
                padding: const EdgeInsets.only(right: 5,),
                child: Text(
                  widget.arabic[index + previousVerses]['aya_text'],
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: arabicFontSize,
                    fontFamily: arabicFont,
                    color: const Color.fromARGB(196, 0, 0, 0),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:const [

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }



  SafeArea SingleSuraBuilder(LenghtOfSura) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.sura + 1 != 1) {
      for (int i = widget.sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
        //print("previousVerses=$previousVerses");
      }
    }

    if (!view)
      for (int i = 0; i < LenghtOfSura; i++) {
        fullSura += (widget.arabic[i + previousVerses]['aya_text']);
        //دي معناها انو بيضف عدد الايا بتاع السور اللي قليه على الندكس  عشان يقدر يوصل
        // ل اول السوره ويبفضل ليلف في الفور لو لحد ما يوصل لنهايه السوره
        
      }




    return SafeArea(
      child: Container(
        //color: const Color.fromARGB(255, 253, 251, 240),
        child: view
            ? ScrollablePositionedList.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [

                (index != 0) || (widget.sura == 0) || (widget.sura == 8)
                    ? const Text('')
                    : const RetunBasmala(),
                Container(
                  color: index % 2 != 0
                      ? AppColor.mainColor.withOpacity(.8)
                      : AppColor.textColor.withOpacity(.1),
                  child: PopupMenuButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: verseBuilder(index, previousVerses),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {
                            saveBookMark(widget.sura + 1, index);
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.bookmark_add,
                                color:
                                Color.fromARGB(255, 56, 115, 59),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Bookmark'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {

                          },
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.share,
                                color:
                                Color.fromARGB(255, 56, 115, 59),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Share'),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            );
          },
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: LenghtOfSura,
        )
            : ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.sura + 1 != 1 && widget.sura + 1 != 9
                          ? const RetunBasmala()
                          : const Text(''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          fullSura, //mushaf mode
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: mushafFontSize,
                            fontFamily: arabicFont,
                            color: const Color.fromARGB(196, 44, 44, 44),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    int LengthOfSura = noOfVerses[widget.sura];


    return Scaffold(
      
      appBar: AppBar(
        leading: Tooltip(
          message: 'Mushaf Mode',
          
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextButton(

              child: const Icon(
                Icons.auto_stories_outlined,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                setState(() {
                  view = !view;
                });
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();

              }, 
            icon:const Icon(Icons.arrow_forward_ios,size: 25,color: Colors.black,),
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          // widget.
          widget.suraName,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'quran',
             ),
        ),
        backgroundColor: AppColor.mainColor,
        elevation: 1,
      ),
      body: SingleSuraBuilder(LengthOfSura),
    );
  }
}
class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: Text(
          'بسم الله الرحمن الرحيم',
          style: TextStyle(fontFamily: 'me_quran', fontSize: 30),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }
}