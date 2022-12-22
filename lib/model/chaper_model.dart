class ChaptersModel {
  ChaptersModel({
    required this.chapters,
  });
  late final List<Chapters> chapters;
  
  ChaptersModel.fromJson(Map<String, dynamic> json){
    chapters = List.from(json['chapters']).map((e)=>Chapters.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['chapters'] = chapters.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Chapters {
  Chapters({
    required this.id,
    required this.revelationPlace,
    required this.revelationOrder,
    required this.bismillahPre,
    required this.nameSimple,
    required this.nameComplex,
    required this.nameArabic,
    required this.versesCount,
    required this.pages,
    required this.translatedName,
  });
  late final int id;
  late final String revelationPlace;
  late final int revelationOrder;
  late final bool bismillahPre;
  late final String nameSimple;
  late final String nameComplex;
  late final String nameArabic;
  late final int versesCount;
  late final List<int> pages;
  late final TranslatedName translatedName;
  
  Chapters.fromJson(Map<String, dynamic> json){
    id = json['id'];
    revelationPlace = json['revelation_place'];
    revelationOrder = json['revelation_order'];
    bismillahPre = json['bismillah_pre'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    versesCount = json['verses_count'];
    pages = List.castFrom<dynamic, int>(json['pages']);
    translatedName = TranslatedName.fromJson(json['translated_name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['revelation_place'] = revelationPlace;
    _data['revelation_order'] = revelationOrder;
    _data['bismillah_pre'] = bismillahPre;
    _data['name_simple'] = nameSimple;
    _data['name_complex'] = nameComplex;
    _data['name_arabic'] = nameArabic;
    _data['verses_count'] = versesCount;
    _data['pages'] = pages;
    _data['translated_name'] = translatedName.toJson();
    return _data;
  }
}

class TranslatedName {
  TranslatedName({
    required this.languageName,
    required this.name,
  });
  late final String languageName;
  late final String name;
  
  TranslatedName.fromJson(Map<String, dynamic> json){
    languageName = json['language_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['language_name'] = languageName;
    _data['name'] = name;
    return _data;
  }
}