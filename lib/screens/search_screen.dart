import 'package:flutter/material.dart';
import 'package:quran_app/model/chaper_model.dart';


class DataSearch extends SearchDelegate{

 
  List<Chapters> chapter;
  DataSearch({required this.chapter});



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
    List<Chapters> filterTitle=chapter.where((element) => element.nameArabic.startsWith(query)).toList();
    //List filterTitle=chapter.where((element) => element.contains(query)).toList();



    return ListView.builder(
        itemCount:(query.isEmpty)? chapter.length:filterTitle.length,
        itemBuilder:(context,index){
          return InkWell(
            onTap: (){
              query=query.isEmpty?chapter[index].nameArabic:filterTitle[index].nameArabic;
              showResults(context);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 8),
             // child: Text((query.isEmpty)? names[index]:filterNames[index]),
              child:  Text((query.isEmpty)? chapter[index].nameArabic:filterTitle[index].nameArabic),
            ),
          );
        },
    );
  }
  
}