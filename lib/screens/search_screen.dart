import 'package:flutter/material.dart';
import 'package:quran_app/screens/quran/surah/custom_build_surah.dart';
import 'package:quran_app/widget/custom_cart_for_surah.dart';

import '../shared/component/constains.dart';

List<Map> fName=[];
class DataSearch extends SearchDelegate{

 
  List<Map> arabicName;
  DataSearch({required this.arabicName});



  List names=[
    "mohamed","ahmed","ali","said","khaled","wael","yasser","shady"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query="";
        },
        icon: Icon(Icons.close_outlined,),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    },
        icon: Icon(Icons.arrow_back_ios,),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(query));
  }

  //محتوى البحث
  @override
  Widget buildSuggestions(BuildContext context) {

    //List filterNames=names.where((element) => element.contains(query)).toList();
    
    // List<Movie>ff=pop.where((element) => element.title.startsWith(query)).toList();


    //List filterTitle=popularTitle.where((element) => element.contains(query)).toList();
    List<Map> filterTitle=arabicName.where((element) => element["name"].startsWith(query)).toList();
    //List filterTitle=chapter.where((element) => element.contains(query)).toList();
  


    return ListView.builder(
        itemCount:(query.isEmpty)? arabicName.length:filterTitle.length,
        itemBuilder:(context,index){
          return InkWell(
            onTap: (){
              //query=query.isEmpty?arabicName[index]["name"]:filterTitle[index]["name"];
              //showResults(context);
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomBuildSurah(
                          arabic: quran[0],
                          sura: index,
                          suraName: filterTitle[index]['name'],
                          ayah: 0,
                        )),
                  );
            },
            
            child: CustomCardSurah(
              arabicName: (query.isEmpty)? arabicName[index]["name"]:filterTitle[index]["name"],
              name: (query.isEmpty)? arabicName[index]["nameEN"]:filterTitle[index]["nameEN"],
              meccaOrmadina: "",
              number: "${index+1}",
              verses: "${noOfVerses[index]} verses",
            ),
          );
        },
    );
  }
  
}